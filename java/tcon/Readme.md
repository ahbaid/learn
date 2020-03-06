# tcon.java

## Ideas:
* Improve error handling. 
 - What if someone enters a character that's not a number? 
 - What will your code do? How can you handle this?

~~~~
MacBook-Air:tcon ahbaidg$ java tcon

========================================
1. Fahrenheit to Celsius conversion
2. Celsius to Fahrenheit conversion
3. Quit
========================================
Selection: a
Exception in thread "main" java.util.InputMismatchException
	at java.util.Scanner.throwFor(Scanner.java:864)
	at java.util.Scanner.next(Scanner.java:1485)
	at java.util.Scanner.nextInt(Scanner.java:2117)
	at java.util.Scanner.nextInt(Scanner.java:2076)
	at tcon.get_selection(tcon.java:24)
	at tcon.main(tcon.java:30)
~~~~

* What about if I wanted to pass in the temp with a "C" or "F" suffix, then have the code figure out which way to convert?
 - For example: if I entered 100F then the program knows it has to convert to Celsius and vice versa.

~~~~~
Enter a temperature to convert: 100F
The Celsius equivalent is 37.78C
Quit? (y/n): n

Enter a temperature to convert: 37.78C
The Fahrenheit equivalent is: 100F
Quit? (y/n): y

Bye!
~~~~~

* How would you make this take the conversion as an argument when calling the program?
~~~~
java tcon 100F
Celsius: 37.78F
~~~~
