MacRubyAutomation
=================

*getting started*


***The Following Notes are from the MacRuby Page***

  LLVM is a moving target and breaks periodically. We recommend to install
  revision 127367 of branch 2.9, being sure to specify the correct C and
  C++ compilers through environment variables.

   $ svn co
   https://llvm.org/svn/llvm-project/llvm/branches/release_29@127367
   llvm-2.9
   $ cd llvm-2.9
   $ env CC=/usr/bin/gcc CXX=/usr/bin/g++ ./configure
   --enable-bindings=none --enable-optimized --with-llvmgccdir=/tmp
   $ env CC=/usr/bin/gcc CXX=/usr/bin/g++ make
   $ sudo env CC=/usr/bin/gcc CXX=/usr/bin/g++ make install


    rvm install macruby



various scripts for automating common tasks 


I call these scripts from Alfred for quick access...


- audioengine_IO  switches the current audio device to the
  audioengine_d1 device

- jabra_IO switches the current audio input and output device to use
  Jabra headset

