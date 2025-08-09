# half_adder_UVM_TB

Test plan
  Objective: Verifying the half adder performs the correct logical operation:
  `sum = a ^ b`
  `carry = a & b`

  Test Cases:
        a b   sum   carry
  TC1	  0	0	  0	    0	      Both inputs zero
  TC2	  0	1	  1	    0	      One input high
  TC3	  1	0	  1	    0	      One input high
  TC4	  1	1	  0	    1	      Both inputs high

  No clock or reset needed (pure combinational logic).
  Self-checking mechanism will be added in testbench.
  Simulation ends when all test cases complete.

Wave Output:
  


  

