//UTS Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//UTS, Design Module Source Code

`timescale 1ms/1ms 
//Mendefinisikan skala waktu yang digunakan di program
//Sehingga, kode #10 berarti delay selama 10 milisekon
module trafficlight(X, clock, M, K, H); 
//Membuat modul "trafficlight" dengan parameter X, clock, M, K, H
    input X, clock; //Mendeklarasikan X dan clock sebagai input
    output reg M, K, H; //Mendeklarasikan M, K, H sebagai output register
    reg [1:0] state; 
    //Mendeklarasikan state sebagai array dengan 2 elemen, bertipe register
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    //Mendefinisikan state-state sebagai 2 bilangan biner. State bertipe parameter
    //State S0 = 00, State S1 = 01, State S2 = 10, State S3 = 11

    always @(posedge clock)
    //Membuat always block yang selalu dieksekusi ketika clock mengalami positive edge
    //Blok ini bertujuan untuk mendefinisikan output M, K, H pada setiap state-nya
    begin
      case (state) 
      //Membuat iterasi switch case dengan state sebagai parameter yang berubah
        S0: //Jika state= S0,
        begin
          M = 1; //Lampu merah menyala
          K = 0; //Lampu kuning mati
          H = 0; //Lampu hijau mati
        end
        S1: //Jika state = S1,
        begin
          M = 0; //Lampu merah mati
          K = 1; //Lampu kuning menyala
          H = 0; //Lampu hijau mati
        end
        S2: //Jika state = S2,
        begin
          M = 0; //Lampu merah mati
          K = 0; //Lampu kuning mati
          H = 1; //Lampu hijau menyala
        end
        S3: //Jika state = S3,
        begin
          M = 0; //Lampu merah mati
          K = 0; //Lampu kuning mati
          H = 0; //Lampu hijau mati
        end
      endcase //Mengakhiri switch case loop
    end //Mengakhiri always block
        
    always @(posedge clock)
    //Membuat always block yang selalu dijalankan ketika clock berada di positive edge
    //Blok ini untuk mendeskripsikan state apa yang dijalankan untuk input X yang berbeda
    begin
      case(X) 
      //Membuat switch case loop untuk nilai X yang berbeda
      1: //Jika X = 1,
      begin
         state = S0; //Jalankan state 0
         #96000; //Delay 96000 milisekon (96 sekon)
         state = S1; //Jalankan state 1
         #4000; //Delay 4000 milisekon (4 sekon)
         state = S2; //Jalankan state 2
         #20000; //Delay 20000 milisekon (20 sekon)
      end
      0: //Jika X = 0,
      begin
        state = S1; //Jalankan state 1
        #4000; //Delay 4000 milisekon (4 sekon)
        state = S3; //Jalankan state 3
        #4000; //Delay 4000 milisekon (4 sekon)
      end
      endcase //Mengakhiri switch case loop
    end //Mengakhiri always block
endmodule //Mengakhiri modul
