import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
public class FreqTracker {
    // function to count frequency of each word
    public static Map<String, Integer> freqOfWords(String s) {
        HashMap<String, Integer> hm = new HashMap<>();

        // check if string is empty or null
        if (s == null || s.trim().isEmpty())
            return hm;

        // convert to lowercase and remove punctuation marks
        String cleanTxt = s.toLowerCase().replaceAll("[^a-zA-Z0-9\\s]", " ");

        // split string into array of words based on spaces
        String[] st = cleanTxt.trim().split("\\s+");

        // loop through each word and update count in hashmap
        for (String word : st) {
            hm.put(word, hm.getOrDefault(word, 0) + 1);
        }

        return hm;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("enter string value : ");
        String s = sc.nextLine();
        Map<String, Integer> mp = freqOfWords(s);
        for (Map.Entry<String, Integer> entry : mp.entrySet()) {
            System.out.println(entry.getKey() + " -> " + entry.getValue());
        }
        sc.close();
    }
}
