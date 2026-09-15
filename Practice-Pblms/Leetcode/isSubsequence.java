/* PROBLEM LINK -->  https://leetcode.com/problems/is-subsequence/

                      Is Subsequence problem */

class Solution {
    public boolean isSubsequence(String s, String t) {
      
        int m=s.length();  // Length of target subsequence s
        int n=t.length();  // Length of source string t
     // use two-pointer approach 
        int j=0;
        for(int i=0;i<n;i++){
            if(i<n && j<m){
    // if both characters eqaul then just increment both i and j
            if(s.charAt(j)==t.charAt(i)){
            
                j++;
            }}
          }
      // Returns true if all characters in s were matched in order
        return j==m;
    }
}
