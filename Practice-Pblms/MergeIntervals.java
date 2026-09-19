/* PROBLEM LINK ----  https://leetcode.com/problems/merge-intervals/

                                Merge Intervals                   */

class Solution {
    public int[][] merge(int[][] intervals) {
        // Sort intervals by their start times
        Arrays.sort(intervals,(a,b)->Integer.compare(a[0],b[0]));
        List<int[]> li=new ArrayList<>();
        // Track the current interval's start and end times
       int stym = intervals[0][0];
       int etym = intervals[0][1];
       int n=intervals.length;
       for(int i=1;i<n;i++){
        // Overlap found: extend the current interval's end time
        if(intervals[i][0]<=etym){
            etym= Math.max(etym,intervals[i][1]);
            stym = Math.min(stym,intervals[i][0]);
        
        }
        // No overlap: save current interval and reset tracking variables
        else{
            li.add(new int[]{stym,etym});
              stym =intervals[i][0];
             etym = intervals[i][1];

         } }
         // Add the final interval
        li.add(new int[]{stym,etym});
        // Convert list back to array output
       return li.toArray(new int[li.size()][]);
    }}
