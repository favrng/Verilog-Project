//PR 5 Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//PR 5, Test Bench Source Code

`include "PR5.v" //Mengimpor program "PR5.v" yang telah dibuat sebelumnya
module PR5_tb; //Membuat modul "PR5_tb"
    reg X, clock; //Mendeklarasikan X dan clock sebagai register
    wire Aplus, Bplus, Z; //Mendeklarasikan Aplus, Bplus, dan Z sebagai wire
    integer i; //Mendeklarasikan i sebagai integer untuk counter for loop

    PR5 uut (.X(X), .Aplus(Aplus), .Bplus(Bplus), .clock(clock), .Z(Z));
    //Membuat modul test bench Unit Under Test (UUT) dari modul desain

    initial begin //Membuat block initial begin yang hanya dieksekusi di awal
        X = 0; //Mendefinisikan nilai awal X, X = 0
        clock = 0; //Mendefinisikan clock = 0 pada awalnya
        $monitor ("Input X = %b, clock = %b, Next State A+B+ = %b%b, Output Z = %b\n", X, clock, Aplus, Bplus, Z);
        //Menampilkan Input, clock, Next State, dan Output di monitor cmd

        for (i = 0; i <= 20; i++) begin //Membuat iterasi for loop untuk mendefinisikan nilai X dan clock
            #10; //Memberi delay 10 nanosekon antarinterasi
            X = $random; //Nilai X didefinisikan secara acak
            clock = ~clock; //Nilai clock adalah lawan nilai clock iterasi sebelumnya
        end //Mengakhiri for loop
    end //Mengakhiri initial begin
endmodule //Mengakhiri modul