//PR 6 Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//Bidirectional Shift Register 4 bit
//Design Module Source Code

module BDSR4bit (X, clock, Data, Aplus, Bplus, Cplus, Dplus);
//Membuat modul BDSR4bit dengan parameter X, clock, Data, Aplus, Bplus, Cplus, dan Dplus
//A, B, C, D adalah present state
//Sedangkan, Aplus, Bplus, Cplus, dan Dplus adalah next state
    input X, clock, Data; //Mendeklarasikan X, clock, dan Data sebagai input
    reg A, B, C, D; //Mendeklarasikan A, B, C, dan D sebagai register
    output reg Aplus, Bplus, Cplus, Dplus; 
    //Mendeklarasikan Aplus, Bplus, Cplus, dan Dplus sebagai output register

    always @(posedge clock)
    //Membuat always block yang akan dieksekusi ketika clock mengalami positive edge (dari 0 ke 1)
    //Pada D flip flop, nilai next state sama dengan input flip flop
    begin
        case (X) //Membuat switch case loop untuk X
            1: //Jika X = 1, angka akan bergeser ke kanan, dengan Data menjadi MSB
            begin //Geser kanan
                Aplus = Data; //Mendefinisikan Aplus (MSB = Data)
                Bplus = A; //Mendefinisikan Bplus
                Cplus = B; //Mendefinisikan Cplus
                Dplus = C; //Mendefinisikan Dplus
            end //Mengakhiri case X = 1
            0: //Jika X = 0, angka akan bergeser ke kiri, dengan Data menjadi LSB
            begin //Geser kiri
                Aplus = B; //Mendefinisikan Aplus
                Bplus = C; //Mendefinisikan Bplus
                Cplus = D; //Mendefinisikan Cplus
                Dplus = Data; //Mendefinisikan Dplus (LSB = Data)
            end //Mengakhiri case X = 0
        endcase //Mengakhiri switch case loop X
    end //Mengakhiri always block

    always @(negedge clock) 
    //Membuat always block yang akan dieksekusi ketika clock mengalami negative edge (dari 1 ke 0)
    //Pada D flip flop, nilai next state sama dengan present state
    begin //Menyimpan nilai Aplus, Bplus, Cplus, dan Dplus di A, B, C, dan D
        A = Aplus; //Mendefinisikan A
        B = Bplus; //Mendefinisikan B
        C = Cplus; //Mendefinisikan C
        D = Dplus; //Mendefinisikan D
    end //Mengakhiri always block
endmodule //Mengakhiri modul
