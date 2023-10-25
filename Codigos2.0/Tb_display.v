module Tb_display();
	reg a, b, c, d, ready, reset;
	wire [6:0] dse_t, dsd_t;

	Display tb(.a(a), .b(b), .c(c), .d(d), .ready(ready), .reset(reset), .dse(dse_t), .dsd(dsd_t));

	initial begin
		
		$dumpfile("teste_gtk.vcd");
		$dumpvars;
		
		// testando para entrada 0 saida 10
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 1 saida 3
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 2 saida 9
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 3 saida 0
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b1;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 4 saida 8
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 5 saida 15
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 6 saida 2
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 7 saida 13
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 8 saida 14
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		
		// testando para entrada 9 saida 12
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 10 saida 11
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 11 saida 4
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		
		
		// testando para entrada 12 saida 7
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 13 saida 1
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 14 saida 6
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		ready = 0;
		
		// testando para entrada 15 saida 5
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1;
		#4;
		ready = 1;
		$display( "Entradas = %b%b%b%b, Saida display esquerdo = %b%b%b%b%b%b%b,Saida display direito = %b%b%b%b%b%b%b",
						a, b, c, d, dse_t[6], dse_t[5], dse_t[4], dse_t[3], dse_t[2], dse_t[1], dse_t[0],
						dsd_t[6],dsd_t[5],dsd_t[4],dsd_t[3],dsd_t[2],dsd_t[1],dsd_t[0]);
		
		ready = 0;
		$stop;
	end
endmodule
