/* PROBLEM LINK : https://leetcode.com/problems/product-of-array-except-self/

                                  PRODUCT OF ARRAY EXCEPT SELF             */

class Solution {
    public int[] productExceptSelf(int[] nums) {
      // Count number of zeroes in the given array to handle various cases
        int zcnt=0;
        int n=nums.length;
        int totalProd = 1;
        int[] res = new int[n];
    // First pass: Count zeros and compute product of all non-zero numbers
        for(int x:nums){
            if(x==0) zcnt++;
            else totalProd *= x;
        }
    // Second pass: Build result array based on zero count logic
        for(int i=0;i<n;i++){
    // Case 1: More than one zero exists -> every product will be 0
            if(zcnt >1) res[i]=0;
    // Case 2: Exactly one zero -> non-zero positions become 0, zero position gets totalProduct
            else if(zcnt ==1) res[i]=(nums[i]==0)?totalProd : 0;
    // Case 3: No zeros -> divide total product by current element    
            else res[i] = totalProd/nums[i];
        }
        return res;
    }
}
// Time Complexity: O(n) - Requires two simple passes over the input array of length n.
// Space Complexity: O(1) - Uses constant extra space (excluding the output array).

