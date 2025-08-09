`timescale 1ns/1ps

module tb_half_adder;
  //TB signals
  logic A, B, Sum, Carry;
  //DUT Instantition
  half_adder DUT (.a(A), .b(B), .sum(Sum), .carry(Carry));
  //task to drive stimulus, wait, and check output
  task run_test(input logic a_in, input logic b_in, input logic expected_sum, input logic expected_carry);
    begin
      A = a_in;
      B = b_in;
      #1; // Wait for propagation delay
      
      // Check outputs
      if (Sum === expected_sum && Carry === expected_carry) begin
        $display("PASS: A=%0b B=%0b => Sum=%0b Carry=%0b", A, B, Sum, Carry);
      end else begin
        $display("FAIL: A=%0b B=%0b => Sum=%0b (exp=%0b), Carry=%0b (exp=%0b)", 
                 A, B, Sum, expected_sum, Carry, expected_carry);
      end
    end
  endtask

  //Stimulus generation
  initial begin
    $dumpfile("wave.vcd");
  	$dumpvars(0, tb_half_adder);
    $display("Starting Half Adder TestBench....");
    run_test(0,0,0,0);
    
    run_test(0,1,1,0);
    
    run_test(1,0,1,0);
    
    run_test(1,1,0,1);
    
    $display("Test bench completed...");
    #1;
    $finish;

  end
endmodule