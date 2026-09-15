/* PROBLEM LINK       -->     https://leetcode.com/problems/search-insert-position/

                              SEARCH INSERT POSITION         */

class Solution {
    public int searchInsert(int[] nums, int target) {
        int l=0;
        int h=nums.length-1;
        int ans=nums.length;
        while(l<=h){
          // calculate middle index to prevent overflow
            int mid=l+(h-l)/2;
            if(nums[mid]>=target){
          // // Store potential insertion index or exact match
                ans =mid;
                h=mid-1;  // search left half for smaller valid index
            }
            else{
                l=mid+1;  // search right half if target is larger
            }
        }
        return ans;       // Return target index or insertion position
    }
    }
