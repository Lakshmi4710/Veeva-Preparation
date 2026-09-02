-- Given array of n integers find distance of any two closest numbers in the above array

import java.util.*;
// main class
public class ClstNum{
    public static long minimumDistance(int[] nums) {
        if (nums.length < 2) return -1;
// assign max value
        long mindis = Long.MAX_VALUE;
// apply sort
        Arrays.sort(nums);
// logic to find the minimum difference within the elements i.e closest numbers from given array 
        for (int i = 1; i < nums.length; i++) {
            long dif = (long) nums[i] - nums[i - 1];
            mindis = Math.min(mindis, dif);
        }
// return result
        return mindis;
    }
// main method
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
	 System.out.println("Enter n value: ");
        int n = sc.nextInt();
        int[] nums = new int[n];
	System.out.println("Enter  values: ");
        for (int i = 0; i < n; i++) {
            nums[i] = sc.nextInt();
        }
        System.out.println(minimumDistance(nums));

        sc.close();
    }
}
