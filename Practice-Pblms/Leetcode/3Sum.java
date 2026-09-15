/* PROBLEM LINK -->  https://leetcode.com/problems/3sum/

                                  3SUM PROBLEM          */

class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        List<List<Integer>> li = new ArrayList<>();
      // Base case: 3 elements are required to form a triplet
        if(nums.length<3){
            return li;
        }
      // sort to handle duplication
        Arrays.sort(nums);
        for(int i=0;i<nums.length;i++){
      // skip duplicates for first element
            if(i>0 && nums[i]==nums[i-1]) continue;
            int j=i+1;        // left pointer
            int k=nums.length-1;   // right pointer
            while(j<k){
                int sum = nums[i]+nums[j]+nums[k];
                if(sum ==0){
                    li.add(Arrays.asList(nums[i],nums[j],nums[k]));
                    j++;
                    k--;
                // skip duplicates for second and third values
                while(j<k && nums[j]==nums[j-1]) j++;
                while(j<k && nums[k]==nums[k+1]) k--;
                }
                // sum too less then move left pointer to increase sum
             else if(sum<0){
                    j++;
                }
               // sum too large then move right pointer to decrease sum
                else{
                    k--;
                }
            }}
            return li;
        
    }
}


