# C++ Compilation Breakdown

## Summary:
When code is compiled there's a lot going on behind the scenes. Take the following example.
~~~~
ahbaidg@safa:~/github/learn/C++[35]$ cat hello.cpp 
~~~~
```c++
#include <iostream>
int main() {
   std::cout << "Hello World!\n";
   return 0;
}
ahbaidg@safa:~/github/learn/C++[36]$ g++ -o hello hello.cpp
ahbaidg@safa:~/github/learn/C++[37]$ ls -al hello
-rwxrwxr-x 1 ahbaidg ahbaidg 8776 Mar 22 11:47 hello
ahbaidg@safa:~/github/learn/C++[38]$ ./hello 
Hello World!
```
When the above code is compiled with the g++ compiler it produces an executable. Behind the scenes several steps are taking place:
1. *Pre-Process*: The code is preprocessed to expand references and produces pre-processed code.
2. *Assemble*: The pre-processed code is then assembled to produce machine code object files for the target platform.
3. *Link*: The object files are then linked and the target program is produced to be run.


## Compilation Steps

### Preprocess
* This step expands source code referrencing all needed areas
~~~~
ahbaidg@safa:~/github/learn/C++/simplemath[6]$ cpp -v simplemath.cpp > simplemath.i
~~~~

~~~~
ahbaidg@safa:~/github/learn/C++/simplemath[10]$ more simplemath.i
# 1 "simplemath.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "simplemath.cpp"
float sum(float a, float b) {
   return a+b;
}

float sub(float a, float b) {
   return a-b;
}

float mul(float a, float b) {
   return a*b;
}

float div(float a, float b) {
   return a/b;
}

float square(float a) {
   return mul(a,a);
}
~~~~

### Compile
~~~~
~~~~
* The compiler takes the pre-processed source code into assembly (machine) code for the platform architecture.

~~~~
ahbaidg@safa:~/github/learn/C++/simplemath[13]$ g++ -S simplemath.i
ahbaidg@safa:~/github/learn/C++/simplemath[15]$ ls -al simplemath.s
-rw-rw-r-- 1 ahbaidg ahbaidg 1952 Mar 21 16:59 simplemath.s
~~~~

### Assemble
~~~~
ahbaidg@safa:~/github/learn/C++/simplemath[22]$ as -o simplemath.o simplemath.s
ahbaidg@safa:~/github/learn/C++/simplemath[23]$ ls -al simplemath.o
-rw-rw-r-- 1 ahbaidg ahbaidg 1824 Mar 21 17:04 simplemath.o
~~~~
* Take the assembler instructions and convert to machine code in an object file "simplemath.o"

### Link
* Finally link the object file to the target program being compiled.
~~~~
ahbaidg@safa:~/github/learn/C++/simplemath[26]$ g++ simplemath.o math.cpp -o math
ahbaidg@safa:~/github/learn/C++/simplemath[27]$ ls -al math
-rwxrwxr-x 1 ahbaidg ahbaidg 9016 Mar 21 17:07 math
ahbaidg@safa:~/github/learn/C++/simplemath[28]$ ./math

Simple Math Demo
================
The sum of 3 and 4 is: 7
~~~~


## Appendix

### A: Source Code (simplemath.cpp)
~~~~
ahbaidg@safa:~/github/learn/C++/simplemath[20]$ more simplemath.cpp 
float sum(float a, float b) {
   return a+b;
}

float sub(float a, float b) {
   return a-b;
}

float mul(float a, float b) {
   return a*b;
}

float div(float a, float b) {
   return a/b;
}

float square(float a) {
   return mul(a,a);
~~~~

### B: Preprocessed Output (simplemath.i)
~~~~
ahbaidg@safa:~/github/learn/C++/simplemath[6]$ cpp -v simplemath.cpp > simplemath.i; cat simplemath.i
Using built-in specs.
COLLECT_GCC=cpp
OFFLOAD_TARGET_NAMES=nvptx-none
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu 7.5.0-3ubuntu1~18.04' --with-bugurl=file:///usr/share/doc/gcc-7/README.Bugs --enable-languages=c,ada,c++,go,brig,d,fortran,objc,obj-c++ --prefix=/usr --with-gcc-major-version-only --program-suffix=-7 --program-prefix=x86_64-linux-gnu- --enable-shared --enable-linker-build-id --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --libdir=/usr/lib --enable-nls --enable-bootstrap --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new --enable-gnu-unique-object --disable-vtable-verify --enable-libmpx --enable-plugin --enable-default-pie --with-system-zlib --with-target-system-zlib --enable-objc-gc=auto --enable-multiarch --disable-werror --with-arch-32=i686 --with-abi=m64 --with-multilib-list=m32,m64,mx32 --enable-multilib --with-tune=generic --enable-offload-targets=nvptx-none --without-cuda-driver --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
Thread model: posix
gcc version 7.5.0 (Ubuntu 7.5.0-3ubuntu1~18.04)
COLLECT_GCC_OPTIONS='-E' '-v' '-mtune=generic' '-march=x86-64'
 /usr/lib/gcc/x86_64-linux-gnu/7/cc1plus -E -quiet -v -imultiarch x86_64-linux-gnu -D_GNU_SOURCE simplemath.cpp -mtune=generic -march=x86-64 -fstack-protector-strong -Wformat -Wformat-security
ignoring duplicate directory "/usr/include/x86_64-linux-gnu/c++/7"
ignoring nonexistent directory "/usr/local/include/x86_64-linux-gnu"
ignoring nonexistent directory "/usr/lib/gcc/x86_64-linux-gnu/7/../../../../x86_64-linux-gnu/include"
#include "..." search starts here:
#include <...> search starts here:
 /usr/include/c++/7
 /usr/include/x86_64-linux-gnu/c++/7
 /usr/include/c++/7/backward
 /usr/lib/gcc/x86_64-linux-gnu/7/include
 /usr/local/include
 /usr/lib/gcc/x86_64-linux-gnu/7/include-fixed
 /usr/include/x86_64-linux-gnu
 /usr/include
End of search list.
COMPILER_PATH=/usr/lib/gcc/x86_64-linux-gnu/7/:/usr/lib/gcc/x86_64-linux-gnu/7/:/usr/lib/gcc/x86_64-linux-gnu/:/usr/lib/gcc/x86_64-linux-gnu/7/:/usr/lib/gcc/x86_64-linux-gnu/
LIBRARY_PATH=/usr/lib/gcc/x86_64-linux-gnu/7/:/usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu/:/usr/lib/gcc/x86_64-linux-gnu/7/../../../../lib/:/lib/x86_64-linux-gnu/:/lib/../lib/:/usr/lib/x86_64-linux-gnu/:/usr/lib/../lib/:/usr/lib/gcc/x86_64-linux-gnu/7/../../../:/lib/:/usr/lib/
COLLECT_GCC_OPTIONS='-E' '-v' '-mtune=generic' '-march=x86-64'
~~~~

### C: Assembler Code (simplemath.s)
~~~~
ahbaidg@safa:~/github/learn/C++/simplemath[13]$ g++ -S simplemath.i
ahbaidg@safa:~/github/learn/C++/simplemath[15]$ ls -al simplemath.s
-rw-rw-r-- 1 ahbaidg ahbaidg 1952 Mar 21 16:59 simplemath.s
ahbaidg@safa:~/github/learn/C++/simplemath[15]$ more simplemath.s
	.file	"simplemath.cpp"
	.text
	.globl	_Z3sumff
	.type	_Z3sumff, @function
_Z3sumff:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movss	-4(%rbp), %xmm0
	addss	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z3sumff, .-_Z3sumff
	.globl	_Z3subff
	.type	_Z3subff, @function
_Z3subff:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movss	-4(%rbp), %xmm0
	subss	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z3subff, .-_Z3subff
	.globl	_Z3mulff
	.type	_Z3mulff, @function
_Z3mulff:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movss	-4(%rbp), %xmm0
	mulss	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z3mulff, .-_Z3mulff
	.globl	_Z3divff
	.type	_Z3divff, @function
_Z3divff:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movss	-4(%rbp), %xmm0
	divss	-8(%rbp), %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z3divff, .-_Z3divff
	.globl	_Z6squaref
	.type	_Z6squaref, @function
_Z6squaref:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0
	movl	-4(%rbp), %eax
	movaps	%xmm0, %xmm1
	movl	%eax, -8(%rbp)
	movss	-8(%rbp), %xmm0
	call	_Z3mulff
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z6squaref, .-_Z6squaref
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
~~~~

## Reference
| Desc | Link |
| ---- | ---- |
| Headers | https://www.learncpp.com/cpp-tutorial/header-files/ |
| Classes with Headers | https://www.learncpp.com/cpp-tutorial/89-class-code-and-header-files/ |
| gcc / g++ docs | https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html |
