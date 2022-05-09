//UTS Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//UTS, Test Bench Source Code

`timescale 1ms/1ms
`include "UTS.v"
//Mendefinisikan skala waktu yang digunakan di program
//Kode #10 berarti delay selama 10 milisekon
module trafficlight_tb;
//Membuat modul "trafficlight_tb"
    reg X, clock; //Mendeklarasikan X dan clock sebagai register
    wire M, K, H; //Mendeklarasikan M, K, H sebagai wire
    integer i, j, counter; //Mendeklarasikan i, j, counter sebagai integer

    trafficlight uut (.X(X), .clock(clock), .M(M), .K(K), .H(H));
    //Membuat modul test bench Unit Under Test (UUT) dari modul desain "trafficlight"

    initial begin
    //Membuat blok yang dieksekusi di awal
    //Blok ini untuk menampilkan tulisan di CMD
      $monitor ("Detik ke-%3d, Clock = %b, X = %b, M = %b, K = %b, H = %b", counter, clock, X, M, K, H);
      //Arti dari %3d adalah dibuat space untuk 3 karakter untuk menuliskan counter
    end //Mengakhiri blok initial begin

    initial begin
    //Membuat blok yang hanya dieksekusi di awal
    //Blok ini bertujuan untuk mendefinisikan clock
      clock = 0; //Clock awal bernilai 0
      j = 0; //Variabel j sebagai penghitung, bernilai 0 di awal
      while (j <= 600) begin //Membuat iterasi while loop untuk mendefinisikan clock
      //Iterasi dijalankan ketika j = 0 hingga j = 600
        clock = ~clock; //Clock sesudahnya adalah negatif dari clock sekarang
        //Ini dilakukan karena clock berdetak dari 0-1-0-1 dan seterusnya
        #500; //Jeda antar clock adalah 500 milisekon (0,5 sekon)
        //Diberi jeda 0,5 sekon karena pada 1 sekon terjadi 1 bukit dan 1 lembah clock
        j++; //Penghitung j di-increment agar nilainya bertambah
        //Jika j mencapai 600, while loop akan berhenti
        //Akan ada 600 sampel yang masing-masing dieksekusi selama 0,5 detik
        //Sehingga keseluruhan proses dieksekusi selama 300 detik
      end //Mengakhiri while loop
    end //Mengakhiri blok initial begin

    initial begin
    //Membuat blok yang hanya dieksekusi di awal
    //Blok ini bertujuan untuk mendefinisikan input X
      X = 1; //Memberi nilai awal X = 1
      #120000; //Memberi jeda 120000 milisekon (120 detik)
      //Hal ini karena pada soal, jika X = 1, dijalankan state S0 selama 96 detik
      //Lalu state S1 selama 4 detik, dan state S2 selama 20 detik
      //Sehingga butuh 96+4+20 = 120 detik untuk menyelesaikan semua proses yang terjadi
      X = 0; //Memberi nilai X = 0 setelah X = 1
      #8000; //Memberi jeda 8000 milisekon (8 detik)
      //Hal ini karena jika X = 0, dijalankan state S1 selama 4 detik
      //Dilanjutkan state S3 selama 4 detik
      //Sehinga totalnya adalah 8 detik untuk menyelesaikan semua proses
    end //Mengakhiri blok initial begin

    initial begin
    //Membuat blok yang hanya dieksekusi di awal
    //Blok ini bertujuan untuk mendefinisikan counter waktu
      counter = 0; //Nilai awal counter didefinisikan 0
      i = 0; //Penghitung i bernilai 0 pada awalnya
      while(i <= 300) begin //Membuat while loop untuk mendefinisikan counter
        counter++; //Counter akan ditambah 1 seiring dijalankannya loop
        #1000; //Memberi delay 1000 milisekon (1 sekon) sebelum dilaksanakan proses selanjutnya
        //Setelah 1 detik, counter akan bertambah 1
        //Sehingga jika misalnya counter = 96, maka sudah berlalu 96 detik
        i++; //Penghitung i di-increment seiring loop dieksekusi
        //Penghitung i bertujuan untuk mengakhiri while loop ketika i sudah bernilai 300
        //Yang berarti jika sudah ada 300 sampel (300 detik)
      end //Mengakhiri while loop
    end //Mengakhiri blok initial begin
endmodule //Mengakhiri modul