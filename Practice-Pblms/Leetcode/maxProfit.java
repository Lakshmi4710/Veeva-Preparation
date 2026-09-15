/*  PROBLEM LINK -->   https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

                BEST TIME TO BUY AND SELL STOCK          */

class Solution {
    public int maxProfit(int[] prices) {
      // Track lowest price seen so far
        int buy =Integer.MAX_VALUE ;
      // max profit we can get
        int sell = 0;
        for(int i=0;i<prices.length;i++){
        if(buy > prices[i]){
      // update to lower buying price
            buy = prices[i];
        }
        else{
      // calculate profit if sold today and keep the maximum
    sell = Math.max(sell,prices[i]-buy);
    }}
      // return overall max profit
    return sell;
}
}
