# export MKPLAB=your_sa_password
export SQLOPTS="-w 120 -W -e"
alias sqlsc='sqlcmd -S 199.1.1.21 -U sa  -P "$MKPLAB" $SQLOPTS'
alias sqlti='sqlcmd -S 199.1.1.22 -U sa  -P "$MKPLAB" $SQLOPTS'
