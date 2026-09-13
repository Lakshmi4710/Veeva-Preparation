// Given a string formatted in camelCase, write a program to count the total number of words in it.

import java.util.*;
public class NumofWords {
    static int numofWords(String s) {
        /* Counts words in a camelCase string by counting uppercase letters.
           Starts at 1 to account for the first lowercase word.
         */
        if (s == null || s.length() == 0) {
            return 0;
        }
        // Initialize to 1 assuming camelCase (1st word is lowercase)
        int cnt = 1;
        // Iterate through each character 
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            // Increment count whenever a new word starts (uppercase letter found)
            if (ch >= 'A' && ch <= 'Z') {
                cnt++;
            }}
        return cnt;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        if (sc.hasNextLine()) {
            String s = sc.nextLine();
            System.out.println(numofWords(s));
        }
        sc.close();
    }
}
