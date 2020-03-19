import java.util.Scanner;

public class Sales
{
   
    public static void banner() 
    {
       System.out.printf("\nSales v1.0\n");
       System.out.printf("=============================\n");
    }

    public static int get_number(String s)
    {
       System.out.print(s);
       Scanner input = new Scanner (System.in);
       return input.nextInt();
    }
 
    public static void main(String args[])
    {

       final int months=12;
       String [] Months = new String[months];
       Months[0]  = "January";
       Months[1]  = "February";
       Months[2]  = "March";
       Months[3]  = "April";
       Months[4]  = "May";
       Months[5]  = "June";
       Months[6]  = "July";
       Months[7]  = "August";
       Months[8]  = "September";
       Months[9]  = "October";
       Months[10] = "November";
       Months[11] = "December";

       int []  monthlySales = new int[months];
       int totalSales = 0;
       float avgMonthSales = 0;
       int monthsAboveAvg = 0;
       int maxMonth = 0;
       int maxSales = 0;

       banner();
       
       for (int mth=1; mth<=months; mth++)
       {
          int sales = get_number("Enter number of cars sold for month "+mth+": ");
          monthlySales[mth-1] = sales;
          totalSales += monthlySales[mth-1];
       }
       avgMonthSales = (float) totalSales/months;

       for (int i=0; i<monthlySales.length; i++)
       {
          if (monthlySales[i] > avgMonthSales) 
          {
             monthsAboveAvg++;
          }
          
          if (monthlySales[i] > maxSales)
          {
             maxMonth=i+1;
             maxSales=monthlySales[i];
          }

       }

       System.out.printf("\n");
       System.out.printf("Analysis: \n");
       System.out.printf("=========\n");
       System.out.printf("Average number of cars sold per month was: %.2f\n",avgMonthSales);
       System.out.printf("Total sales was: %d\n",totalSales);
       System.out.printf("Months above average was: %d\n",monthsAboveAvg);
       System.out.printf("Highest Month was month %d (%s) with %d cars sold.\n",maxMonth,Months[maxMonth-1],monthlySales[maxMonth-1]);
       System.out.printf("\n");

    }
   
}
