import java.util.Scanner;
public class keypress {
   
    public static char get_char(String s) {
       System.out.print(s);
       Scanner Keyboard = new Scanner (System.in);
       return Keyboard.next().charAt(0);
    }

    public static void main(String args[]) {
        char v = get_char("Press a key (0 quits): ");
        while (v!='0') {
           System.out.printf("Pressed: [%s]\n",v);
           v = get_char("Press a key (0 quits): ");
        }
    }
   
}
