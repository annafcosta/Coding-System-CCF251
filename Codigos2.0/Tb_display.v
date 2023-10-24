module tb_display();
	reg a, b, c, d, ready, reset;
	wire s0, s1, s2, s3;
	wire [6:0] dse_t, dsd_t;

	Display tb(.a(a), .b(b), .c(c), .d(d), .ready(ready), .reset(reset), .dse(dse_t), .dsd(dsd_t));

	initial begin
		
		$dumpfile("teste_gtk.vcd");
		$dumpvars;
		
		
		reset = 1;
		#4;
		reset = 0;
		#4;
		
		// Teste com diferentes valores de entrada
		a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; ready = 1'b1; // Defina ready conforme necessário
		#10; 

		$stop;
	end
endmodule
