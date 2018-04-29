package myapps;

import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.kstream.KStream;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.Topology;

import java.util.Arrays;
import java.util.Properties;
import java.util.concurrent.CountDownLatch;

public class Pipe {

    public static void main(String[] args) throws Exception {
        Properties properties = new Properties();
        properties.setProperty(
                StreamsConfig.APPLICATION_ID_CONFIG,
                "streams-pipe"
                );
        properties.setProperty(
                StreamsConfig.BOOTSTRAP_SERVERS_CONFIG,
                "localhost:9092"
                );
        properties.put(
                StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG,
                Serdes.String().getClass()
                );
        properties.put(
                StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG,
                Serdes.String().getClass()
                );

        String inputTopic = "streams-plaintext-input";
        String outputTopic = "streams-pipe-output";
        // The logic is defined as a "topology" of nodes.
        // Get a stream for the topic 'streams-plaintext-input'.
        // The str -> str mapping associates a record with its value.
        // The processed records will be sent to the "streams-pipe-output" topic.
        StreamsBuilder streamsBuilder = new StreamsBuilder();
        KStream<String, String> source = streamsBuilder.stream(inputTopic);

        source
            .flatMapValues(v -> Arrays.asList(v.split("\\s+")))
            .filter((String k, String v) -> v.equals("lol") ? true : false)
            .to(outputTopic);

        final Topology topology = streamsBuilder.build();
        System.out.println(topology.describe());

        final KafkaStreams streams = new KafkaStreams(topology, properties);
        final CountDownLatch countdownLatch = new CountDownLatch(1);
        Runtime.getRuntime().addShutdownHook(
                new Thread("streams-shutdown-hook") {
                    @Override
                    public void run() {
                        streams.close();
                        countdownLatch.countDown();
                    }
                });
        try {
            streams.start();
            countdownLatch.await();
        }
        catch (Throwable e) {
            System.exit(1);
        }
        System.exit(0);
    }
}
