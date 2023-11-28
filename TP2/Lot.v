module Lot(clk, num, reset, fim, fim_jogo, insere, premio, p1, p2);
  input  clk, reset, fim, insere, fim_jogo; 
  input  [0:3] num;
  output reg [0:1] premio;
  output reg [0:4] p1, p2;
  
  reg [3:0] state; // registrador do estado
  reg [3:0] c;   // registrador de cção
  
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
    s4  = 4'b0100,
	sg1 = 4'b0101,
	sg2 = 4'b0110,
    sg0 = 4'b0111;
					
  
  
  
  initial begin
    state <= s0;
    premio = 2'b00;
    p1 = 5'b00000;
    p2 = 5'b00000;
	c = 4'b0000;
  end 
  
  always @(posedge clk , posedge reset , posedge fim_jogo , posedge fim) begin
    if (reset == 1'b1) begin
			state <= s0;
			premio <= 2'b00;
			p1 <= 5'b00000;
			p2 <= 5'b00000;
			c <= 4'b0000;
    end else if (fim_jogo == 1'b1) begin
			state <= s0;
			premio <= 2'b00;
			c <= 4'b0000;
    end else if (fim == 1'b1) begin // Corrigido o teste de fim
		case(state)
			sg1: begin
				premio = 2'b01;
				p1 <= p1 + 1;
			end
			sg2: begin
				premio = 2'b10;
				p2 <= p2 + 1;
			end
            sg0: begin
                premio = 2'b00;
            end
			default: premio = 2'b00; 
		endcase
	 end else if(insere) begin
			case (state)
                s0: begin
                    if(num == 4'b0100)begin
                        c <= c+1;
                        state <= s1;
                    end else if(num != 4'b0100)begin
                        c <= 0;
                        state <= s1;
                    end
                end
                s1: begin
                    if(num == 4'b0111)begin
                        c <= c+1;
                        state <= s2;
                    end else if (num != 4'b0111) begin
                        c <= 0;
                        state <= s2;                       
                    end
                end
                s2: begin
                    if(num == 4'b0000)begin
                        c <= c+1;
                        state <= s3;
                    end else if(num != 4'b0000)begin
                        if (c >= 2) begin
                            state <= s3;
                        end else begin
                            c <= 0;
                            state <= s3;
                        end
                        
                    end
                end
                s3: begin
                    if(num == 4'b0001)begin
                        if (c >= 3) begin
                            state <= sg1;
                        end else begin
                            c <= c +1;
                            state <= s4;  
                        end
                    end else if(num != 4'b0000)begin
                        if (c >= 2) begin
                            state <= s4;
                        end else begin
                            c <= 0;
                            state <= s4;
                        end
                    end
                end
                s4: begin
                   case (c)
                        2'b10: begin
                            if(insere && (num == 4'b1001))begin
                                state <= sg2;
                            end else if(insere && (num != 4'b1001))begin
                                state <= sg0;
                            end
                        end
                        2'b11: begin
                            if(insere &&(num == 4'b1001))begin
                                state <= sg1;
                            end else if(insere && (num != 4'b1001))begin
                                state <= sg2;
                            end
                        end
						2'b00: begin
                            state <= sg0;
                        end		
                    endcase 
                end 
            endcase
     end  
  end
endmodule
