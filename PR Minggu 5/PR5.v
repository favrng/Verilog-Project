//PR 5 Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//PR 5, Design Module Source Code

module PR5(X, Aplus, Bplus, clock, Z); 
//Membuat module PR5 dengan parameter X, Aplus, Bplus, clock, Z
    input X, clock; //Mendeklarasikan X dan clock sebagai input
    reg A, B; //Mendeklarasikan A dan B (present state D flip-flop) sebagai register
    output reg Aplus, Bplus, Z; 
    //Mendeklarasikan Aplus, Bplus (next state D flip flop) dan Z sebagai output register

    always @(posedge clock) 
    //Membuat always block yang akan dijalankan ketika clock berada di positive edge (dari 0 ke 1)
    begin //Pada positive edge clock, next state D flip flop sama dengan input-nya
        Z = A&X; //Mendefinisikan Z sebagai output dari A dan X yang dikenakan AND gate
        Aplus = B&(~X); 
        //Mendefinisikan Aplus sebagai output dari B dan NOT X yang dikenakan AND gate
        Bplus = X; //Mendefinisikan Bplus sebagai X
    end //Mengakhiri always block

    always @(negedge clock) 
    //Membuat always block yang akan dijalankan ketika clock berada di negative edge (dari 1 ke 0)
    begin //Pada negative edge clock, next state D flip flop sama dengan previous state-nya
    //A dan B adalah previous state
    //Sehingga nilai Aplus dan Bplus disimpan di A dan B sebelum ke kasus selanjutnya
        A = Aplus; //Mendefinisikan A = Aplus 
        B = Bplus; //Mendefinisikan B = Bplus
    end //Mengakhiri always block
endmodule //Mengakhiri modul