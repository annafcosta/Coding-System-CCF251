module Codificador(A, B, C, D, Ready, Reset, S0, S1, S2, S3 );
  // entradas dos bits e os acionadores ready e reset. 
  input wire A, B, C, D, Ready, Reset;
  output wire S0, S1, S2, S3;
	// saídas codificada conforme documentação de orientação do TP. 
  //Definindos as saídas por meio de equações boleanas
  assign S0 = (~A & ~C & D & Ready) | (~B & C & ~D & Ready) | (B & D & Ready) | (A & B & ~C & Ready) | Reset;
 

  assign S1 = (~B & ~C & ~D & Ready) | (~A & ~C & D & Ready) | (B & C & ~D & Ready) | (A & ~D & Ready) | Reset;
  

  assign S2 = (~A & B & D & Ready) | (A & ~B & ~C & Ready) | (A & C & D & Ready) | (A & B & ~D & Ready) | Reset;
 

  assign S3 = (~A & ~C & ~D & Ready) | (~B & ~D & Ready) | (~A & B & D & Ready) | (A & ~B & ~C & Ready) | Reset;
 

endmodule
