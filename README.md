CudaTestEnv
===========

Basic incomplete host based cuda api implementation use for testing my programming assignments for the Coursera "Heterogeneous Parallel Programming" class

test harness for developing solutions for the coursera 'Heterogeneous Parallel Programming'. It does not use a nvidia Gpu but instead simulates the threading and thread local variables, shared memory and barriers. It only support 1 and 2 dimensional array because that is all needed so far to complete my assignements.


Note, since this is using only using the standard g++ compiler, there is no error checking for using non cuda functions and contrustructs with in the device functions. In fact, the __global__ is just a noop.

you will also need to call the device function using standard c compliant syntax and also pass the function to setupCudaSim. Here is an example 

<pre><code>
  #ifndef CUDA_EMU
    vecAdd<<< dimGrid, dimBlock >>>(deviceInput1, deviceInput2, deviceOutput, inputLength);
  #else 
    setupCudaSim (dimGrid , dimBlock , boost::bind(vecAdd,deviceInput1,deviceInput2,deviceOutput, inputLength));
  #endif
 </code></pre>

I developed this on cygwin in Windows 7. You will need g++  (I used version 4.5) and boost thread and system.


to build and run my example, simply execute 

make run

the is create the mp1 binary and use the  foo as the first and second argument

./mp1 foo foo 


to use your own input create text files for input1 and input2. Each integer must be space separated and each row is terminated by a newline

