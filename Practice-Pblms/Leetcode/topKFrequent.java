/* PROBLEM LINK : https://leetcode.com/problems/top-k-frequent-elements/

                                    TOP K FREQUENT ELEMENTS          */

class Solution {
    public int[] topKFrequent(int[] nums, int k) {
      // Use a hashmap to keep track of each element's frequency
        Map<Integer,Integer> map =new HashMap<>();
      // put every element from given nums into hashmap
        for(int x:nums){
            map.put(x,map.getOrDefault(x,0)+1);
            
        }
      // Now store only the keys(i.e elements) in list created
        List<Integer> li =new ArrayList<>(map.keySet());
      // Sort according to frequency of elements that are in list(descending order because top k frequent asked in question)using lambda expression
        li.sort((a,b)->map.get(b)-map.get(a));
      // use an array to store top k elements.
        int[] res= new int[k];
        for(int i=0;i<k;i++){
            res[i]=li.get(i);
        }
      // display the resulted array
        return res;
    }
}
