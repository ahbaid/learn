# tcon.java

## Ideas:
* Improve error handling. 
** What if someone enters a character that's not a number? 
** What will your code do? How can you handle this?

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

