//PR 2 Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//Source code

//Dibuat modul untuk full adder 1 bit terlebih dulu
module fa_1bit(A, B, sum, C, carry);
//Modul dinamakan fa_1bit, dengan parameter A, B, sum, C, dan carry
	input A, B, C; //Mendeklarasikan variabel A, B, dan C sebagai input (masukan)
	output sum, carry; //Mendeklarasikan variabel sum dan carry sebagai output (keluaran)
	wire S1, C1, C2; //Mendefinisikan S1, C1, dan C2 sebagai wire/kawat internal yang menghubungkan 2 gerbang logika

	xor(S1, A, B); //A dan B dikenakan operasi XOR, dengan outputnya berupa kawat S1
	xor(sum, S1, C); //Kawat S1 dan C dikenakan operasi XOR, dengan outputnya berupa sum
	and(C2, S1, C); //Kawat S1 dan C dikenakan operasi AND, dengan output = C2
	and(C1, A, B); //A dan B dikenakan operasi AND, dengan output = C1
	or(carry, C1, C2); //Kawat C1 dan C2 dikenakan operasi OR, dengan output = carry
endmodule //Mengakhiri modul

//Modul untuk 4 bit full adder kemudian dibuat, sebagai berikut
module fa_4bit(A, B, S, Cin, Co);
//Modul dinamakan fa_4bit, dengan parameter A, B, S, Cin, dan Co (carry output)
	input [3:0] A,B; //A dan B dideklarasikan sebagai input berupa array dengan 4 elemen
	output [3:0] S; //S dideklarasikan sebagai output berupa array dengan 4 elemen
	wire [3:1] C; //C dideklarasikan sebagai wire/kawat internal. C adalah array dengan 3 elemen
	input Cin; //Cin dideklarasikan sebagai input (masukan)
	output Co; //Co dideklarasikan sebagai output (keluaran)

//Selanjutnya, modul fa_1bit dipanggil dengan positional mapping, untuk membentuk full adder (FA) 4 bit.
//FA 4 bit terdiri atas 4 FA 1 bit.
	fa_1bit fa0(A[0], B[0], S[0], Cin, C[1]); //FA 1 bit pertama, dinamakan fa0
	fa_1bit fa1(A[1], B[1], S[1], C[1], C[2]); //FA 1 bit kedua, dinamakan fa1
	fa_1bit fa2(A[2], B[2], S[2], C[2], C[3]); //FA 1 bit ketiga, dinamakan fa2
	fa_1bit fa3(A[3], B[3], S[3], C[3], Co); //FA 1 bit keempat, dinamakan fa3
//Karena berlaku positional mapping, urutan variabel input dan output mengikuti urutan yang terdapat pada modul fa_1bit
endmodule //Mengakhiri modul
