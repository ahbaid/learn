import java.util.Scanner;
public class tcon
{
   
    public static double f2c (double f)
    {
       return (5.0 / 9.0 * (f - 32));
    }
   
    public static double c2f (double c)
    {
       return (9.0 / 5.0 * c + 32);
    }

    public static int get_selection()
    {
       System.out.print("\n========================================\n");
       System.out.print("1. Farenheit to Celcius conversion\n");
       System.out.print("2. Celcius to Farenheit conversion\n");
       System.out.print("3. Quit\n");
       System.out.print("========================================\n");
       System.out.print("Selection: ");
       Scanner input = new Scanner (System.in);
       return input.nextInt();
    }
 
    public static void main(String args[])
    {

        int z = get_selection();
       
        while (z==1 || z==2)
        {
            switch (z)
            {
                case 1:
                {
                   System.out.print("\nEnter fahrenheit temperature: ");
                   Scanner input = new Scanner (System.in);
                   double temp_in  = input.nextDouble();
                   double temp_out = f2c(temp_in);
                   System.out.printf("The celsius value of the fahrenheit %.2f temperature is %.2f\n", temp_in, temp_out);
                   break;
                }
               
                case 2:
                {
                   System.out.print("\nEnter celsius temperature: ");
                   Scanner input = new Scanner (System.in);
                   double temp_in  = input.nextDouble();
                   double temp_out = c2f(temp_in);
                   System.out.printf("The fahrenheit value of the celsius %.2f temperature is %.2f\n", temp_in, temp_out);
                   break;
                }
               
                default:
                {
                   break;  
                }
            }

            z = get_selection();
        }

        System.out.printf("\nBye!\n\n");

    }
   
}
