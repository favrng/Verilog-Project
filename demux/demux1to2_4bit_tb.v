//PR 3 Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//Demux 1 to 2 Test Bench Source Code

`include "demux1to2_4bit.v" //Mengimpor program demux1to2_4bit.v yang telah dibuat
module demux1to2_4bit_tb; //Modul dinamakan demux1to2_4bit_tb
	reg [3:0] X; //Mendeklarasikan input X sebagai register (array 1x4)
	reg C; //Mendeklarasikan input C sebagai register
	wire Cnot; //Mendeklarasikan Cnot sebagai wire
	wire [3:0] A; //Mendeklarasikan output A sebagai wire (array 1x4)
	wire [3:0] B; //Mendeklarasikan output B sebagai wire (array 1x4)
	integer i; //Mendeklarasikan i sebagai integer untuk counter for loop

	demux1to2_4bit uut (.X(X), .A(A), .B(B), .C(C)); 
	//Dari modul desain yang telah dibuat, dibuat wujud test bench-nya
	//Wujud test bench berupa Unit Under Test (UUT)
	
	initial begin //Dieksekusi sekali, untuk memberi nilai awal X dan C
	  X = 0;
	  C = 0;
	  $monitor ("X = %b, C = %b, A = %b, B = %b\n", X, C, A, B); //Menampilkan input X, C, dan output A, B di monitor CMD
	  for (i = 0; i <= 20; i++) begin //Membuat for loop untuk iterasi kombinasi input sistem (X dan C)
	  #10 //Diberi jeda 10 nanosekon antariterasi
	  X = $random; //Memberi nilai random ke input X
	  C = $random; //Memberi nilai random ke input C
		  end //Akhir for loop
	end //Akhir initial begin
endmodule //Akhir modul