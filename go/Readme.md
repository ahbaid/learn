### helloworld.go
~~~~
bash-3.2$ cat helloworld.go 
package main

import "fmt"

func main() {
   fmt.Println("Hello World!")
}
~~~~

### Run helloworld.go
~~~~
bash-3.2$ go run helloworld.go 
Hello World!
~~~~

### Build helloworld.go
~~~~
bash-3.2$ go build helloworld.go 
bash-3.2$ ls -alh
total 3944
drwxr-xr-x   5 ahbaidg  wheel   160B Jan 31 22:38 .
drwxr-xr-x  20 ahbaidg  wheel   640B Jan 31 22:35 ..
-rw-r--r--   1 ahbaidg  wheel   959B Jan 31 22:38 Readme.md
-rwxr-xr-x   1 ahbaidg  staff   1.9M Jan 31 22:38 helloworld
-rw-r--r--   1 ahbaidg  wheel    75B Jan 31 22:37 helloworld.go
~~~~

### Run the binary
~~~~
bash-3.2$ ./helloworld 
Hello World!
~~~~
