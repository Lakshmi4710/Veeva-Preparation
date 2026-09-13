/* Given that January 1st of a specific year is a Monday,
  write code to calculate what day of the week lands on when given year,month,day as input ? */

import java.util.*;
class WeekDay {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
System.out.println("Year : ");
        int year = sc.nextInt();
System.out.println("Month : ");
        int month = sc.nextInt();
System.out.println("Day : ");
        int day = sc.nextInt();
  // Cumulative day count at the start of each month for non-leap year 
int[] cum={0,31,59,90,120,151,181,212,243,273,304,334};
  // days of week starting from monday
String[] wkdy ={"MONDAY","TUESDAY","WEDNESDAY","THURSDAY","FRIDAY","SATURDAY","SUNDAY"};
  // Add 1 extra day if it's a leap year AND the target date is after February
int leap = (year %400 ==0 ||( year % 4==0 && year %100!=0)) && month >2 ? 1 : 0 ;
  // Calculate total days passed from Jan 1st and map to weekday index (0-6)
int index= (cum[month-1]+day-1+leap)%7;
System.out.println("WEEK DAY : "+wkdy[index]);
}}
