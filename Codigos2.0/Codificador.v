/*
Declaração do Modulo
encode
*/
module Codificador(A, B, C, D, ready, reset, S0, S1, S2, S3);

  // Definir as entradas de 4 bits:
  input wire A;
  input wire B;
  input wire C;
  input wire D;
  input wire ready;
  input wire reset;

  // Definir as saídas:
  output wire S0;
  output wire S1;
  output wire S2;
  output wire S3;

      // Definição das expressões booleanas reduzidas via k-map:
      assign S0 = (~A & ~C & D) | (~B & C & ~D) | (B & D) | (A & B & ~C);
      // Função do 1º bit descrita por A'C'D + B'CD' + BD + ABC'

      assign S1 = (~A & ~B & ~C) | (~A & ~C & D) | (B & C & ~D) | (A & ~D);
      // Função do 2º bit descrita por A'B'C' + A'C'D + BCD' + AD

      assign S2 = (~A & B & D) | (A & ~B & ~C) | (A & C & D) | (A & B & ~D);
      // Função do 3º bit descrita por A'BD + AB'C' + BCD + AB'D

     assign S3 = (~A & ~C & ~D) | (~B & ~D) | (~A & B & D) | (A & ~B & ~C);
      // Função do 4º bit descrita por A'C'D' + B'D' + A'BD + AB'C'

endmodule


