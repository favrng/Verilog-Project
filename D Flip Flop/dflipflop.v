//PR 4 Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//D Flip Flop (Modul Desain Gate Level)

module dflipflop (D, clock, Q, Qbar); //Membuat modul berjudul "dflipflop" dengan parameter D, clock, Q, dan Qbar
    input D, clock; //Mendeklarasikan D dan clock sebagai input
    output Q, Qbar; //Mendeklarasikan Q dan Qbar sebagai output
    wire s1, s2; //Mendefinisikan s1 dan s2 sebagai wire. s1 dan s2 adalah kabel di dalam rangkaian

    not not1 (Dnot, D); //D dikenakan operasi not, yang output-nya adalah Dnot
    nand nand1 (s1, D, clock); //D dan clock dijadikan input NAND gate pertama. Output-nya adalah kabel s1
    nand nand2 (s2, Dnot, clock); //Dnot dan clock dijadikan input NAND gate kedua. Output-nya adalah kabel s2
    nand nand3 (Q, s1, Qbar); //Kabel s1 dan Qbar dijadikan input NAND gate ketiga. Output-nya adalah Q
    nand nand4 (Qbar, Q, s2); //Q dan kabel s2 dijadikan input NAND gate keempat. Output-nya adalah Qbar
endmodule //Mengakhiri modul
