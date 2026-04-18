# 📘 Binary to Gray Code Converter (4-bit) – Verilog

## 🔹 Overview

This project implements a **4-bit Binary to Gray Code Converter** in Verilog along with a **self-checking testbench**.
Gray code is widely used in digital systems because **only one bit changes at a time**, reducing errors in transitions.

---

## 🔹 Features

* Converts 4-bit binary input to 4-bit Gray code
* Efficient dataflow implementation
* Includes behavioral equivalent (commented)
* Self-checking testbench with pass/fail tracking
* Iterative testing for all input combinations (0–15)

---

## 🔹 Module Description

### 📌 Inputs

* `a_i [3:0]` → 4-bit binary input

### 📌 Outputs

* `b_o [3:0]` → 4-bit Gray code output

---

## 🔹 Working Principle

Gray code conversion rule:

* **MSB remains same**
* Remaining bits are XOR of adjacent binary bits

### 🔸 Conversion Equations

```
b_o[3] = a_i[3]
b_o[2] = a_i[3] ^ a_i[2]
b_o[1] = a_i[2] ^ a_i[1]
b_o[0] = a_i[1] ^ a_i[0]
```

### 🔸 Behavioral Representation (Alternative)

```
b_o = a_i ^ (a_i >> 1)
```

---

## 🔹 Truth Table

| Binary | Gray |
| ------ | ---- |
| 0000   | 0000 |
| 0001   | 0001 |
| 0010   | 0011 |
| 0011   | 0010 |
| 0100   | 0110 |
| 0101   | 0111 |
| 0110   | 0101 |
| 0111   | 0100 |
| 1000   | 1100 |
| 1001   | 1101 |
| 1010   | 1111 |
| 1011   | 1110 |
| 1100   | 1010 |
| 1101   | 1011 |
| 1110   | 1001 |
| 1111   | 1000 |

---

## 🔹 Testbench Details

The testbench (`tb_BtGconvertor`) is **self-checking**:

### 🔸 Features

* Iterates through all 16 input combinations
* Computes expected Gray code internally
* Compares DUT output with expected result
* Tracks:

  * Total checks
  * Pass count
  * Fail count

### 🔸 Error Reporting

Displays mismatch details:

```
Time: X | Binary: XXXX, Gray: XXXX | Expected Gray: XXXX
```

---

## 🔹 Simulation

### ▶️ Tools

* ModelSim / QuestaSim
* Xilinx Vivado
* Icarus Verilog + GTKWave

### ▶️ Run (Icarus Verilog Example)

```bash id="btg_run"
iverilog -o BtGconvertor.vvp BtGconvertor.v tb_BtGconvertor.v
vvp BtGconvertor.vvp
gtkwave BtG_Convertor.vcd
```

---

## 🔹 Output

* Console output using `$monitor`
* Error messages for mismatches
* Final summary:

  ```
  Total Checks: X | Pass: Y, Fail: Z
  ```
* Waveform dump file:

  ```
  BtG_Convertor.vcd
  ```

---

## 🔹 Sample Output Format

```id="btg_sample"
Time: 10 | Binary: 0101, Gray: 0111
```

---

## 🔹 Applications

* Rotary encoders
* Error minimization in digital communication
* Asynchronous circuits
* ADCs (Analog-to-Digital Converters)

---

## 🔹 Design Insights

* XOR-based conversion ensures single-bit transition
* Dataflow modeling improves clarity and synthesis efficiency
* Behavioral alternative provides compact implementation

---

## 🔹 File Structure

```id="btg_struct"
├── BtGconvertor.v        # Converter Design
├── tb_BtGconvertor.v     # Self-checking Testbench
├── BtG_Convertor.vcd     # Waveform output (generated)
└── README.txt            # Documentation
```
