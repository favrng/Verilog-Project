//PR 4 Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//D Flip Flop (Test Bench Source Code)

`include "dflipflop.v" //Mengimpor file "dflipflop.v" yang berisi modul desain, yang telah dibuat sebelumnya
module dflipflop_tb; //Membuat modul test bench "dflipflop_tb"
    reg D, clock; //Mendeklarasikan D dan clock sebagai register
    wire s1, s2, Q, Qbar; //Mendeklarasikan s1, s2, Q, dan Qbar sebagai wire
    integer i; //Mendeklarasikan i sebagai bilangan bulat/integer untuk counter for loop

    dflipflop uut (.D(D), .clock(clock), .Q(Q), .Qbar(Qbar));
    //Membuat modul test bench dari modul desain. Modul test bench dinamakan Unit Under Test (UUT)

    initial begin //Akan dieksekusi sekali saja, di awal
        D = 0; //Mendefinisikan nilai awal input D
        clock = 0; //Mendefinisikan nilai awal clock
        $monitor ("D = %b, clock = %b, Q = %b, Qbar = %b\n", D, clock, Q, Qbar);
        //Menampilkan nilai D, clock, Q, dan Qbar pada monitor/layar CMD
	    for (i = 0; i <= 20; i++) begin //Membuat iterasi for loop untuk mendefiniskan nilai D dan clock
			#10 //Memberi jeda 10 nanosekon antariterasi
			D = $random; //Memberi nilai random ke input D
            clock = ~clock; //Clock akan bernilai invers dari clock sebelumnya
        end //Mengakhiri for loop
    end //Mengakhiri initial begin
endmodule //Mengakhiri modul
