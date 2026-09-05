// Problem Statement: Find the number of subarrays in an array of integers (containing positive, negative, and 0s) whose sum equals k.

import java.util.HashMap;
import java.util.Scanner;

public class SubArrMatchK {

    // Method to calculate the total number of subarrays with sum equal to k
    public static int subarrExist(int n, int[] arr, int k) {
        int c = 0;          // Tracks the total count of valid subarrays found
        int curSum = 0;     // Stores the running prefix sum

        // HashMap to store frequencies of prefix sums (PrefixSum -> Count)
        HashMap<Integer, Integer> hm = new HashMap<>();
        
        // Base case: A prefix sum of 0 has occurred once (handles subarrays starting at index 0)
        hm.put(0, 1);

        for (int i = 0; i < n; i++) {
            curSum += arr[i]; // Add current element to prefix sum

            // If (curSum - k) exists in the map, add its frequency to the total count
            if (hm.containsKey(curSum - k)) {
                c += hm.get(curSum - k);
            }

            // Record or update the frequency of the current prefix sum in the map
            hm.put(curSum, hm.getOrDefault(curSum, 0) + 1);
        }

        return c; // Return total subarray count
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Input array size
        System.out.println("enter n value : ");
        int n = sc.nextInt();

        // Input array elements
        int[] arr = new int[n];
        System.out.println("enter values of array : ");
        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }

        // Input target sum k
        System.out.println("enter k value : ");
        int k = sc.nextInt();

        // Execute function and print output
        int res = subarrExist(n, arr, k);
        System.out.println("The number of subarray that equals " + k + " are : " + res);
    }
}
