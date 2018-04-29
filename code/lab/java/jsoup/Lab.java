import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.stream.Stream;

public class Lab {
    public static void main(String[] args) throws IOException {
        //Document doc = Jsoup.connect();
        String html = "<html><body><div class='entry'><div class='2'>lol2</div><div class='1'>lol1</div></div><div class='entry'><div class='2'>lol2</div><div class='1'>lol1</div></div></body></html>";

        Stream.of(html)
            // Split the document into a stream of elements in class 'entry'.
            .flatMap(str -> {
                Document doc = Jsoup.parse(html);
                Elements elems = doc.select(".entry");
                return elems.stream();
            })
            // Transform each element into a string of children nodes' text.
            .map(elem -> {
                String match1 = elem.selectFirst(".1").text();
                String match2 = elem.selectFirst(".2").text();
                return String.format("%s, %s", match1, match2);
            })
            .forEach(elem -> {System.out.println(elem);});
    }
}
