import java.util.Scanner;
public class prime
{
   
    public static void banner() 
    {
       System.out.printf("\nPrime Generator v0.1\n");
       System.out.printf("=============================\n");
    }

    public static int get_number(String s)
    {
       System.out.print(s);
       Scanner input = new Scanner (System.in);
       return input.nextInt();
    }
 
    public static String is_prime(int n)
    {
       if (n==2 || n==1) {
          return "PRIME";
       } else if ((n % 2)==0) {
          return "Even";
       } else {
          return "Odd, Could be prime.... more code please.....";
       }
    }

    public static void get_primes(int nprimes, int startn)
    {
  

       int i=1;
       int evaln=startn;
       while (i<=nprimes)
       {
           System.out.printf("%02d. Evaluating %2d : ",i,evaln);
           System.out.printf("%s\n",is_prime(evaln));
           i++;
           evaln+=1;
       }
    }
 
    public static void main(String args[])
    {
        banner();
        int n = get_number("How many primes? ");
        int s = get_number("Integer to start from? ");
        get_primes(n,s);
        System.out.printf("\n");
    }
   
}
