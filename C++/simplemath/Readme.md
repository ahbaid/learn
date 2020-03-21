# Header Files

## Reference Links
| Desc | Link |
| ---- | ---- |
| Headers | https://www.learncpp.com/cpp-tutorial/header-files/ |
| Classes with Headers | https://www.learncpp.com/cpp-tutorial/89-class-code-and-header-files/ |
| gcc / g++ docs | https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html |

## Compilation Steps
### Preprocess
~~~~
ahbaidg@safa:~/github/learn/C++/simplemath[6]$ cpp -v simplemath.cpp > simplemath.i
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

ahbaidg@safa:~/github/learn/C++/simplemath[7]$ ls -al simplemath.i
-rw-rw-r-- 1 ahbaidg ahbaidg 380 Mar 21 16:24 simplemath.i

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
### Assemble
### Link

