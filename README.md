# BACS: Benchmarks for Approximate Circuit Synthesis (version 1.0)

These benchmarks are released as part of the following accepted publication. 

I. Scarabottolo, G. Ansaloni, G. A. Constantinides, L. Pozzi and S. Reda "Approximate Logic Synthesis: A Survey" **under-review** in Proceedings of the IEEE.

The included benchmarks are

- **x2:**      small benchmark from LGSynth 91. Metric: Hamming Distance (HD). Approximate design generated using BLASYS.
- **mac:**    multiply-add arithmetic circuit. Approximate design generated using BLASYS.
- **buttfly:**      butterfly structure. Metric: Mean Absolute Error (MAE). Approximate design is same as exact.
- **abs_diff:**      absolute difference arithmetic circuit. Metric: Mean Absolute Error (MAE). Approximate design is generated using Circuit Carving (CC) technique.
- **mult16:**  16-bit unsigned multiplier. Metric: Mean Absolute Error (MAE). Approximate design generatered using DRUM.
- **mult8:**  8-bit unsigned multiplier. Metric: Mean Absolute Error (MAE). Approximate design generatered using EvoApproxLib.
- **adder32:** 32-bit adder. Metric: Mean Absolute Error (MAE). Approximate design generatered manually.
- **fft:**     8-point fast fourier transform  sequential circuit from ABACUS release. Metric: Mean Square Error (MSE). Approximate design generated using ABACUS.
- **classifier:**     A support vector machine classifier sequential circuit from ABACUS release.  Metric: misclassified labels (%). Approximate design generated using ABACUS.


Each benchmark circuit comes in its own folder with four files:

- bench/bench.v           original design in Verilog
- bench/bench_test.v      testbench for the design in Verilog
- bench/bench_approx.v    an example of an approximate design for the original design
- bench/bench_qor.py      a python function to evaluate QoR results of approximate design against original design

**Requirements:**
- iverilog for simulation
- Python3


**Usage:** 
To produce the accurate results for each benchmark:

iverilog bench_test.v bench.v

./a.out > res_accurate

To produce the approximate results for each benchmark:

iverilog bench_test.v bench_approx.v

./a.out > res_approx

To compare the results:

python3 ./bench_qor res_accurate res_approx

regression_test is a test script that sweeps across all benchmarks.

