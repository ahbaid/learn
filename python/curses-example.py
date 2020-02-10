import curses

s=curses.initscr()
curses.noecho()
while True:
    c=s.getch()
    if c == ord('q'):
       break
    elif c == curses.KEY_LEFT:
       print("Key Left")
    else:
       print(c)

