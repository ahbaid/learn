import java.util.Scanner;
/**
* <h1>Find prime numbers</h1>
* The prime class takes input form the user for the range and style of output.
* It then proceeds to evaluate each nubmer for it being a prime or not.
* Results are returned along with a count of the number of primes found.
*
* @author Ahbaid Gaffoor
* @version 0.1
* @since 03/07/2020
*/
public class prime {
   
    /**
    * Just a banner.
    */
    public static void banner() {
       System.out.printf("\nPrime Generator v0.1\n");
       System.out.printf("=============================\n");
    }

    /**
    * Get a character and return it.  
    * @param s This is the string to prompt with.
    * @return char The character to return.
    */
    public static char get_char(String s) {
       System.out.print(s);
       Scanner Keyboard = new Scanner (System.in);
       return Keyboard.next().charAt(0);
    }

    /**
    * Get an integer and return it.  
    * @param s This is the string to prompt with.
    * @return int The integer to return.
    */
    public static int get_number(String s) {
       System.out.print(s);
       Scanner Keyboard = new Scanner (System.in);
       return Keyboard.nextInt();
    }
 
    /**
    * Brute force calculation of primes by checking:
    * 1. Is the number 1, 2 or 3? Then it's a prime.
    * 2. Is the number not above? Then check if it's even, if so it's not a prime.
    * 3. The number is now odd. Assume it's a prime.
    *    Check to see if it's not prime by modulus division with all odd numbers greater than 1 up to n-1 for 0 remainder. 
    *    If a zero remainder is found then it's not a prime.
    * @param n Number to test.
    * @return boolean Is the number a prime?
    */
    public static boolean is_prime(int n) {
       boolean Prime = true;
       if (n>=1 && n<=3) {
          return true;
       } else if ((n % 2)==0) {
          return false;
       } else {
          int i=3;
          while ((i<n) && (Prime)) {
            if ((n % i)==0) {
              Prime=false;
            } 
            i+=2;
          }
       }
       return Prime;
    }

    /**
    * This is the method that iterates across the range and handles the logic for output.
    * @param nprimes The number of integers to consider.
    * @param startn The integer to start from.
    * @param verbose Governs the output verbosity.
    * @return int The number of primes found.
    */
    public static int get_primes(int nprimes, int startn, char verbose) {

       int i=1;
       int evaln=startn;
       boolean foundOne=false;
       int primesFound=0;

       if (verbose=='y') {
          System.out.printf("\nEvaluating from %d -> %d showing all results...\n\n",startn,startn+nprimes-1);
       } else {
          System.out.printf("\nEvaluating from %d -> %d showing only prime results...\n\n",startn,startn+nprimes-1);
       }

       while (i<=nprimes) {

           if (is_prime(evaln)) {

              foundOne=true;
              primesFound++;

              if (verbose=='y') {
                  System.out.printf("%02d. %3d is PRIME\n",i,evaln);
              } else {
                  System.out.printf("%d,",evaln);
              }

           } else {
              if (verbose=='y') {
                  System.out.printf("%02d. %3d is NOT-PRIME\n",i,evaln);
              } 
           }

           i++;
           evaln+=1;

       }

       if (foundOne) {
          System.out.printf("\n");
       }

       return primesFound;

    }
 
    /**
    * The main method.
    * @param args Unused.
    */
    public static void main(String args[]) {
        banner();
        int  n = get_number("How many integers to process? ");
        int  s = get_number("Integer to start from? ");
        char v = get_char("Show non-primes(y/n)? ");
        int  p = get_primes(n,s,v);
        System.out.printf("\n");
        System.out.printf("Found %d primes from %d to %d.\n\n",p,s,s+n-1);
    }
   
}
