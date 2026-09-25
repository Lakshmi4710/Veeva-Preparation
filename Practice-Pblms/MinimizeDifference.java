// Problem Title :  Minimize the difference between minimum and maximum elements.

import java.util.Scanner;
import java.util.Arrays;
public class MinimizeDifference {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Get array size from user
        System.out.print("Enter the number of elements: ");
        int size = scanner.nextInt();
	
      	// Get k value from user
        System.out.print("Enter k value : ");
        int k = scanner.nextInt();
        int[] arr = new int[size];

        // Get array elements from user
        System.out.println("Enter " + size + " integers:");
        for (int i = 0; i < size; i++) {
            arr[i] = scanner.nextInt();
        }
	      // Intially finding max and min values from given array
int maxV =arr[0];
int minV =arr[0];
      for(int i=1;i<size;i++){
        if(arr[i] > maxV){
          maxV=arr[i];
        }
        if(arr[i] < minV){
          minV = arr[i];
        }}
    	// If difference blw max& min <=k then its the minimum difference,so return it
  if(maxV-minV <=k) {
    System.out.println("Minimized difference: " + (maxV - minV));
            scanner.close();
            return;
  }
    	//  Now find the spread of each element with mid point value 
  int avg = (maxV+minV)/2;
	    // If element less than avg then do (element + k) to reach near mid value
  for(int i=0;i<size;i++){
    if(arr[i] <= avg){
      arr[i] += k;
    }
    	// Else means if element if far from mid value then do (element - k) to reach near mid value
    else{
      arr[i] -= k;
    }}
    	// Using Java streams to extract the new max and min values after modification
       int maxVal = Arrays.stream(arr).max().getAsInt();
       int minVal = Arrays.stream(arr).min().getAsInt();

  System.out.println("Minimized difference: " + (maxVal - minVal));
        scanner.close();
    }
}
