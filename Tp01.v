/*
Declaração do Modulo
Codificador
*/

module encode (A, B, C, D, ready, reset, S0, S1, S2, S3);

  // Definir as entradas de 4 bits:
  input wire A;
  input wire B;
  input wire C;
  input wire D;
  input wire ready;
  input wire reset;

  // Definir as saídas:
  output reg S0;
  output reg S1;
  output reg S2;
  output reg S3;

  always @(posedge ready or posedge reset) begin
    if (reset) begin
      S0 <= 0;
      S1 <= 0;
      S2 <= 0;
      S3 <= 0;
    end else begin
      // Definição das expressões booleanas:
      S0 <= (~A & ~C & ~D) | (~B & C & ~D) | (B & D) | (A & B & ~C);
      // Função do 1º bit descrita por A'C'D' + B'CD' + BD + ABC'

      S1 <= (~A & ~B & ~C) | (~A & ~C & D) | (B & C & ~D) | (A & ~D);
      // Função do 2º bit descrita por A'B'C' + A'C'D + BCD' + AD

      S2 <= (~A & B & D) | (A & ~B & ~C) | (A & C & D) | (A & B);
      // Função do 3º bit descrita por A'BD + AB'C' + BCD + AB

      S3 <= (~A & ~C & ~D) | (~B & ~D) | (~A & B & D) | (A & ~B & ~C);
      // Função do 4º bit descrita por A'C'D' + B'D' + A'BD + AB'C'
    end
  end
endmodule
