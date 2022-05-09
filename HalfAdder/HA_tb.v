// half_adder_tb.v
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module HA_tb;
    reg a, b;
    wire sum, carry;

 // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  

    HA uut (.a(a), .b(b), .sum(sum), .carry(carry));
    
    initial // initial block executes only once
begin
        $dumpfile("HA_testbench.vcd");
        $dumpvars(); //for gtkwave display       
        $monitor("a=%b, b=%b, carry=%b, sum=%b \n", a, b, carry, sum);
 // values for a and b
        a = 0;         b = 0;
        #period; // wait for period 
        a = 0;         b = 1;
        #period;
        a = 1;         b = 0;
        #period;
        a = 1;         b = 1;
        #period;
    end
endmodule