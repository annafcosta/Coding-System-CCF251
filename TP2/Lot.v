module Lot(clk, num, reset, fim, fim_jogo, insere, premio, p1, p2);
  input  clk, reset, fim, insere, fim_jogo; 
  input  [0:3] num;
  output reg [0:1] premio;
  output reg [0:4] p1, p2;
  
  reg [3:0] state; // registrador do estado
  reg [3:0] astate;// registrador do estado anterior
  //reg [4:0] cont; // contador de insereção 
  
  // num da loteria: 47019
  /* Codificação dos premios:
		- premio 1 = 01
		- premio 2 = 10
		- s/premio = 00
  */
  parameter s0 = 4'b0000,
    s1  = 4'b0001,
    s2  = 4'b0010,
    s3  = 4'b0011,
    s4  = 4'b0100;
 
  
  initial begin
    state <= s0;
    premio = 2'b00;
    p1 = 5'b00000;
    p2 = 5'b00000;
  end
  
  always @(posedge clk or posedge reset or posedge fim_jogo) begin
    if (reset) begin
      state <= s0;
      premio <= 2'b00;
      p1 <= 5'b00000;
      p2 <= 5'b00000;
    end else if (fim_jogo) begin
      state <= s0;
    end else begin
      if (insere && (state == s0) && (num == 4'b0100)) begin 
        state <= s1;
      end
		
      if (insere && (state == s1) && (num == 4'b0111)) begin
        state <= s2;
      end else if (insere && (state == s1) && (num != 4'b0111)) begin
        state <= s0;
      end
      
      if (insere && (state == s2) && (num == 4'b0000)) begin
        state <= s3;
      end else if (insere && (state == s2) && (num != 4'b0000)) begin
        state <= s4;
        astate <= s2;
      end
      
      if (insere && (state == s3) && (num == 4'b0001)) begin
        premio = 2'b01;
        p1 <= p1 + 1;
      end else if(insere && (state == s3) && (num != 4'b0001)) begin
			state <= s4;
			astate <= s3;
		end
		
		if(insere && (state == s4)  && (astate == s2) && (num == 4'b1001)) begin
			premio = 2'b10;
			p2 <= p2 + 1; 
		end else if (insere && (state == s4) && (num != 4'b1001)) begin
			premio = 2'b00;
			// fim de jogo
		end
		
		if(insere && (state == s4) && (astate == s3) && ( num == 4'b1001)) begin
			premio = 2'b01;
			p1 <= p1 + 1;
		end else if(insere && (state == s4) && (astate == s3) && ( num != 4'b1001)) begin
			premio = 2'b10;
			p2 <= p2 + 1;
			// fim de jogo
		end
		
		
		
		
		
    end
  end
endmodule
