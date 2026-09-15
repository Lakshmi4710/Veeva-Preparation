/* PROBLEM LINK  -->    https://leetcode.com/problems/make-string-a-subsequence-using-cyclic-increments/

                    MAKE STRING A SUBSEQUENCE USING CYCLIC INCREMENTS  */

class Solution {
    public boolean canMakeSubsequence(String str1, String str2) {
        int i=0;   // pointer for string-1
        int j=0;   // pointer for string 2
        while(i<str1.length() && j< str2.length()){
            char c1 =str1.charAt(i);
            char c2=str2.charAt(j);
          // Calculate next cyclic character ('z' wraps around to 'a')
            char nxt =(char)('a'+(c1-'a'+1)%26);
          // Match if c1 already equals c2, or if incrementing c1 matches c2
            if(c1==c2 || nxt == c2 ){
              // Match found: advance both pointers
                i++;
                j++;
            }
              // Skip character
            else{
                i++;
            }
        }
      // True if all characters of str2 were matched in order
        return j==str2.length();
    }
}
