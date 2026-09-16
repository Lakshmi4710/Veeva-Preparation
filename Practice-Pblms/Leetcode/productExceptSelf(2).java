/* PROBLEM LINK : https://leetcode.com/problems/product-of-array-except-self/

                                  PRODUCT OF ARRAY EXCEPT SELF             */
class Solution {
    public int[] productExceptSelf(int[] nums) {
int n = nums.length;
int[] prefix = new int[n];
int[] suffix = new int[n];
      
// 1. Calculate Prefix Array (Left to Right)
prefix[0] = 1;
for (int i = 1; i < n; i++) {
    prefix[i] = prefix[i - 1] * nums[i - 1];
}

// 2. Calculate Suffix Array (Right to Left)
suffix[n - 1] = 1;
for (int i = n - 2; i >= 0; i--) {
    suffix[i] = suffix[i + 1] * nums[i + 1];
}

// 3. Combine for Result: result[i] = prefix[i] * suffix[i]
int[] result = new int[n];
for (int i = 0; i < n; i++) {
    result[i] = prefix[i] * suffix[i];
}
    return result;
    }}
// Time Complexity: O(n) - Iterates through the array 3 separate times (prefix, suffix, and result).
// Space Complexity: O(n) - Uses extra memory for the prefix and suffix arrays of size n.
