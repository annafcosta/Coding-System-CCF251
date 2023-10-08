/*
Declaração do Modulo
Codificador
*/

module Codificador (A, B, C, D, ready, reset, S0, S1, S2, S3);

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
      S0 <= 1'bx;
      S1 <= 1'bx;
      S2 <= 1'bx;
      S3 <= 1'bx;
    end else begin
      // Definição das expressões booleanas reduzidas via k-map:
      S0 <= (~A & ~C & D) | (~B & C & ~D) | (B & D) | (A & B & ~C);
      // Função do 1º bit descrita por A'C'D + B'CD' + BD + ABC'

      S1 <= (~A & ~B & ~C) | (~A & ~C & D) | (B & C & ~D) | (A & ~D);
      // Função do 2º bit descrita por A'B'C' + A'C'D + BCD' + AD

      S2 <= (~A & B & D) | (A & ~B & ~C) | (A & C & D) | (A & B & ~D);
      // Função do 3º bit descrita por A'BD + AB'C' + BCD + AB'D

      S3 <= (~A & ~C & ~D) | (~B & ~D) | (~A & B & D) | (A & ~B & ~C);
      // Função do 4º bit descrita por A'C'D' + B'D' + A'BD + AB'C'
    end
  end
endmodule

`timescale 1ns/100ps

module TesteBench();
	reg a, b, c, d, ready, reset;
	wire s0, s1, s2, s3;

	Codificador tb(.A(a), .B(b), .C(c), .D(d), .ready(ready), .reset(reset), .S0(s0), .S1(s1), .S2(s2), .S3(s3));
	
	initial begin
		// Inicialização das variáveis
		// 0;
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		ready = 1;
	
		// Testando para cada numero
		// 1;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 0; b = 0; c = 0; d = 1;
		ready = 1;
		#1;

        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);
		
		// 2;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 0; b = 0; c = 1; d = 0;
		ready = 1;
		#1

        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);
		
		// 3;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 0; b = 0; c = 1; d = 1;
		ready = 1;
		#1
		
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

		// 4;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 0; b = 1; c = 0; d = 0;
		ready = 1;
		#1
		
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

		// 5;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 0; b = 1; c = 0; d = 1;
		ready = 1;
		#1
		
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

		// 6;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 0; b = 1; c = 1; d = 0;
		ready = 1;
		#1
		
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

		// 7;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 0; b = 1; c = 1; d = 1;
		ready = 1;
		#1
		
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

		// 8;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 1; b = 0; c = 0; d = 0;
		ready = 1;
		#1

        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);
		
		// 9;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 1; b = 0; c = 0; d = 1;
		ready = 1;
		#1

        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);
		
		// 10;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 1; b = 0; c = 1; d = 0;
		ready = 1;
		#1

        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);
		
		// 11;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 1; b = 0; c = 1; d = 1;
		ready = 1;
		#1

        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);
		
		// 12;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 1; b = 1; c = 0; d = 0;
		ready = 1;
		#1
		
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

		// 13;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 1; b = 1; c = 0; d = 1;
		ready = 1;
		#1

        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);
		
		// 14;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 1; b = 1; c = 1; d = 0;
		ready = 1;
		#1
		
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

		// 15;
		#1;
		reset = 1;
		ready = 0;
		#1;
		reset = 0;
		a = 1; b = 1; c = 1; d = 1;
		ready = 1;
		#1

        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);
		
		$dumpfile("teste_gtk.vcd");
        $dumpvars;
		
		// Finalizar a simulação
		$stop;
	end
endmodule