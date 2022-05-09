//PR 3 Perancangan Sistem Digital
//Fiorella Averina Gunawan
//NIM 19/443579/TK/48775
//Demux 1 to 2 Source Code (Modul Desain)

module demux1to2_4bit (X, A, B, C); //Membuat modul demux1to2_4bit dengan X, A, B, dan C sebagai parameter
    input [3:0] X; //Mendeklarasikan input X (array 1x4)
    input C; //Mendeklarasikan input C (yang akan bertindak sebagai selektor)
    output reg [3:0] A; //Mendeklarasikan output A (array 1x4) sebagai register
    output reg [3:0] B; //Mendeklarasikan output B (array 1x4) sebagai register
    wire Cnot; //Mendeklarasikan Cnot sebagai wire

always @(X or C) begin //Di bawah ini adalah kode yang akan selalu dieksekusi. Parameternya X dan C 
  case (C) //Switch-case loop dengan kasus nilai C yang berbeda-beda
  1'b0: begin //Kondisi pertama, jika C = 0
      A = X; //Output yang bernilai sama dengan input adalah output A
      B = 0; //Output B akan bernilai 0
  end //Akhir kondisi 1
  1'b1: begin //Kondisi kedua, jika C = 1
      A = 0; //Output A akan bernilai 0
      B = X; //Output B akan sama nilainya dengan input
  end //Akhir kondisi 2
  endcase //Akhir dari switch-case loop
end //Akhir dari blok always
endmodule //Akhir modul