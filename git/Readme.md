# Git config
~~~~
git config --global user.name "Ahbaid Gaffoor"
git config --global user.email "ahbaid@gmail.com"
~~~~

# Init a local repository
~~~~
$ pwd
/Users/ahbaidg/github

$ mkdir newgit
$ cd newgit

$ git init
Initialized empty Git repository in /ahbaid/github/newgit/.git/
$ echo "Hello World" > hello.txt

$ ls -al
total 8
drwxr-xr-x  4 ahbaidg  wheel  128 Mar  3 14:54 .
drwxr-xr-x  8 ahbaidg  wheel  256 Mar  3 14:54 ..
drwxr-xr-x  9 ahbaidg  wheel  288 Mar  3 14:54 .git
-rw-r--r--  1 ahbaidg  wheel   12 Mar  3 14:54 hello.txt

$ git add hello.txt 

$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   hello.txt

$ git commit -m "initialize"
[master (root-commit) 3c34ee0] initialize
 1 file changed, 1 insertion(+)
 create mode 100644 hello.txt

$ git remote add origin git@github.com:ahbaid/newgit.git
$ git push -u origin master
Warning: Permanently added 'github.com,192.30.255.112' (RSA) to the list of known hosts.
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Writing objects: 100% (3/3), 225 bytes | 225.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To github.com:ahbaid/newgit.git
 * [new branch]      master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
~~~~
