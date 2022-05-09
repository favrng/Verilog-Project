`include "demux1to2_1bit.v" //Mengimpor program FA4bit.v yang telah dibuat sebelumnya
//Testbench 1-2 DEMUX
initial begin

// Initialize Inputs
         s = 0;
         d = 0;
// Wait 100 ns for global reset to finish
         #100;
// Add stimulus here
#100; s=0;d=1;
#100; s=1;d=0;
#100; s=1;d=1;
end
