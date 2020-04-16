# BACS: Benchmarks for Approximate Circuit Synthesis

The included benchmarks are

- **x2:**      small benchmark from LGSynth 91. Metric: Hamming Distance (HD). Approximate design generated using BLASYS.
- **b1:**      small benchmark from LGSynth 91. Metric: Hamming Distance (HD). Approximate design generated using BLASYS.
- **mult16:**  16-bit unsigned multiplier. Metric: Mean Absolute Error (MAE). Approximate design generatered using DRUM.
- **adder32:** 32-bit adder. Metric: Mean Absolute Error (MAE). Approximate design generatered manually.
- **fft:**     8-point fast fourier transform circuit sequential from ABACUS release. Metric: Mean Square Error (MSE). Approximate design generated using ABACUS.
- **classifier:**     A support vector machine classifier sequential circuit from ABACUS release.  Metric: misclassified labels (%). Approximate design generated using ABACUS.
- **sqrt:**    A square root circuit from the EPFL benchmark set. Metric: HD. Approximate design generated using BLASYS.
- **sin:**     A sine circuit from the EPFL benchmark set. Metric: HD. Approximate design generated using BLASYS.
- **dec:**     A decoder circuit from the EPFL benchmark set. Metric: HD. Approximate design generated using BLASYS.


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

