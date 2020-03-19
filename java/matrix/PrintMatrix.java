import java.util.Scanner;
import java.util.Random;

public class PrintMatrix
{
   
    public static void banner() 
    {
       System.out.printf("\nThe Matrix v1.0\n");
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

       banner();
       int rows = get_number("Enter number of rows: ");
       int cols = get_number("Enter number of columns: ");

       System.out.printf("\n");

       Random randomGenerator = new Random();
       int [][] matrix = new int[rows][cols];
       int rowTotal = 0;

       for (int row=0; row<rows; row++)
       {
          for (int col=0; col<cols; col++)
          {
              int n = randomGenerator.nextInt(9);
              matrix[row][col] = n;
              System.out.printf("[%d] ",matrix[row][col]);
              rowTotal += matrix[row][col];
          }
          System.out.printf(" total: %4d\n",rowTotal);
          rowTotal=0;
       }

       System.out.printf("\n");

    }
   
}
