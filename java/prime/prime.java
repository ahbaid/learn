import java.util.Scanner;
public class prime {
   
    public static void banner() {
       System.out.printf("\nPrime Generator v0.1\n");
       System.out.printf("=============================\n");
    }

    public static char get_char(String s) {
       System.out.print(s);
       Scanner Keyboard = new Scanner (System.in);
       return Keyboard.next().charAt(0);
    }

    public static int get_number(String s) {
       System.out.print(s);
       Scanner Keyboard = new Scanner (System.in);
       return Keyboard.nextInt();
    }
 
    public static boolean is_prime(int n) {
       if (n==2 || n==1) {
          return true;
       } 
       else if ((n % 2)==0) {
          return false;
       }
       return false;
    }

    public static void get_primes(int nprimes, int startn, char verbose) {

       int i=1;
       int evaln=startn;
       boolean foundOne=false;

       if (verbose=='y') {
          System.out.printf("\nEvaluating from %d -> %d showing all results...\n\n",startn,startn+nprimes-1);
       } else {
          System.out.printf("\nEvaluating from %d -> %d showing only prime results...\n\n",startn,startn+nprimes-1);
       }

       while (i<=nprimes) {

           if (is_prime(evaln)) {
              foundOne=true;
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

    }
 
    public static void main(String args[]) {
        banner();
        int  n = get_number("How many primes? ");
        int  s = get_number("Integer to start from? ");
        char v = get_char("Show non-primes(y/n)? ");
        get_primes(n,s,v);
        System.out.printf("\n");
    }
   
}
