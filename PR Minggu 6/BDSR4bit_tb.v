//PR 6 Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//Bidirectional Shift Register 4 bit
//Test Bench Source Code

`include "BDSR4bit.v" //Mengimpor program "BDSR4bit.v" yang telah dibuat
module BDSR4bit_tb; //Membuat modul BDSR4bit_tb
    reg X, clock, Data; //Mendeklarasikan X, clock, dan Data sebagai register
    wire Aplus, Bplus, Cplus, Dplus;
    //Mendeklarasikan Aplus, Bplus, Cplus, Dplus sebagai wire
    integer i; //Mendeklarasikan i sebagai integer untuk counter for loop

    BDSR4bit uut (.X(X), .clock(clock), .Data(Data), .Aplus(Aplus), .Bplus(Bplus), .Cplus(Cplus), .Dplus(Dplus));
    //Membuat modul test bench UUT dari modul desain

     initial begin //Membuat block initial begin yang dieksekusi di awal saja
        X = 0; //Mendefinisikan nilai awal X (X = 0)
        Data = 0; //Mendefinisikan nilai awal Data (Data = 0)
        clock = 0; //Mendefinisikan clock awal = 0
        $monitor ("Input X = %b, clock = %b, Data = %b, Register = %b%b%b%b\n", X, clock, Data, Aplus, Bplus, Cplus, Dplus);
        //Menampilkan Input X, clock, Data, dan Register di monitor CMD

        for (i = 0; i <= 20; i++) begin //Membuat iterasi for loop untuk mendefinisikan nilai X, Data, dan clock
            #10; //Memberi jeda 10 nanosekon antarinterasi
            X = $random; //Memberi nilai acak pada X
            Data = $random; //Memberi nilai acak pada Data
            clock = ~clock; //Nilai clock adalah lawan nilai clock iterasi sebelumnya
        end //Mengakhiri for loop
    end //Mengakhiri initial begin
endmodule //Mengakhiri modul
