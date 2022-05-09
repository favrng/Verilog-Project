//PR 2 Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//Test Bench Source Code

`include "FA4bit.v" //Mengimpor program FA4bit.v yang telah dibuat sebelumnya
module FA4bit_tb; //Modul dinamakan FA4bit_tb
	reg [3:0] A, B; //Mendeklarasikan A dan B sebagai register; berupa array dengan 4 elemen
	reg Cin; //Mendeklarasikan Cin sebagai register
	wire [3:0] S; //Mendeklarasikan S sebagai register; berupa array dengan 4 elemen
	integer i; //Mendeklarasikan i sebagai integer untuk counter for loop

	fa_4bit uut (.A(A), .B(B), .Cin(Cin), .Co(Co), .S(S)); 
	//Dari modul desain yang sudah ada (fa_4bit), dibuat wujud test bench-nya
	//Wujud test bench berupa Unit Under Test (UUT)

	initial begin //Dieksekusi sekali saja, untuk menetapkan nilai awal A, B, dan Cin
		A = 0;
		B = 0;
		Cin = 0;

		$dumpfile("FA4bit_tb.vcd"); //Membuat file GTKWave dengan nama FA4bit_tb.vcd
 		$dumpvars(); //Menampilkan sinyal di GTKWave Display
		$monitor ("A = %b, B = %b, Cin = %b, Co = %b, S = %b\n", A, B, Cin, Co, S); 
		//Menampilkan nilai A, B, Cin, Co, dan S (biner) pada monitor di terminal
		for (i = 0; i <= 20; i++) begin //Membuat for loop untuk iterasi kombinasi input sistem (A, B, dan Cin)
			#10 //Antar iterasi diberi jeda waktu 50 nanosekon
			A = $random; //Memberi nilai random ke variabel A
			B = $random; //Memberi nilai random ke variabel B
			Cin = $random; //Memberi nilai random ke variabel C
		end //Mengakhiri for loop
	end //Mengakhiri initial begin
endmodule //Mengakhiri modul
