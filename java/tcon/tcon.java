/* 6.22
 * Temperature Conversion
 * Muhammad Gaffoor
 */
//package chapter6hw;
import java.util.Scanner;
public class tcon
{
   
    public static double celcius (double f)
    {
      double cfinal;
        cfinal = 5.0 / 9.0 * (f - 32);
        return cfinal;
    }
   
    public static double farenheit (double c)
    {
        double ffinal;
        ffinal = 9.0 / 5.0 * c + 32;
        return ffinal;
       
    }
 
    public static void main(String args[])
    {
        int z;
        double c = 0;
        double f =0;
        double cfinal;
        System.out.print("1. Farenheit to Celcius conversion\n");
        System.out.print("2. Celcius to Farenheit conversion\n");
        System.out.print("3. Quit\n");
        Scanner input = new Scanner (System.in);
        z = input.nextInt();
       
        while (z!=3)
        {
            switch (z)
            {
                case 1:
                {
                    System.out.print("Enter a farenheit temperature you want in "
                            + "celcius\n");
                    f = input.nextDouble();
                     cfinal = celcius(f);
                     System.out.printf("The celcius value of the "
                             + "farenheit temperature is %.2f\n", cfinal);
               
                    break;
                }
               
                case 2:
                {
                    System.out.print("Enter a celcius temperature you want in "
                            + "farenheit\n");
                    c = input.nextDouble();
                    double ffinal = farenheit(c);
                    System.out.printf("The farenheit value of the celcius "
                            + "temperature is %.2f", ffinal);
                    break;
                   
                }
               
                case 3:
                {
                    break;  
                }
             
            }
        System.out.print("1. Farenheit to Celcius conversion\n");
        System.out.print("2. Celcius to Farenheit conversion\n");
        System.out.print("3. Quit\n");

        z = input.nextInt();
        }
     
    }
   
}
