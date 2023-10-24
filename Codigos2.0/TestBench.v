`timescale 1ns/100ps

module TestBench();
	 reg a, b, c, d, ready, reset;
    wire s0, s1, s2, s3;
    
    Codificador en(.A(a), .B(b), .C(c), .D(d), .ready(ready), .reset(reset), .S0(s0), .S1(s1), .S2(s2), .S3(s3));

	initial begin
			$dumpfile("teste_gtk.vcd");
			$dumpvars;
		
        // Testando para cada numero
	    // 0;
        reset = 1;
        #4; 

        reset = 0;
        #4; 
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        // 1;
        #4; ready = 1;
        #4; ready = 0;
        #4; 
        a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        // 2;
        #4; ready = 1;
        #4; ready = 0;
        #4; 
        a = 1'b0;
        b = 1'b0;
        c = 1'b1;
        d = 1'b0;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        // 3;
		#4;
		reset = 1;
		ready = 0;
		#4;
		a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b1;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        // 4;
		#4;
		reset = 1;
		ready = 0;
		#4;
		a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        //5
        #4;
		reset = 1;
		ready = 0;
		#4;
        a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b1;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        //6
        #4;
		reset = 1;
		ready = 0;
		#4;
        a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        //7
        #4;
		reset = 1;
		ready = 0;
		#4;
        a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        //8
        #4;
		reset = 1;
		ready = 0;
		#4;
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        //9
        #4;
		reset = 1;
		ready = 0;
		#4;
        a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        //10
        #4;
		reset = 1;
		ready = 0;
		#4;
        a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b0;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        //11
        #4;
		reset = 1;
		ready = 0;
		#4;
        a = 1'b1; b = 1'b0; c = 1'b1; d = 1'b1;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        //12
        #4;
		reset = 1;
		ready = 0;
		#4;
        a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        //13
        #4;
		reset = 1;
		ready = 0;
		#4;
        a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b1;
        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        //14
        #4;
		reset = 1;
		ready = 0;
		#4;
        a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b0;

        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

        //15
        #4;
		reset = 1;
		ready = 0;
		#4;
        a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1;

        $display("Time = %0t | Entrada = %0d%0d%0d%0d Saída = %0d%0d%0d%0d",
             $time, a, b, c, d, s0, s1, s2, s3);

		// Finalizar a simulação
		$stop;
	end
endmodule