`include "encode.v"
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