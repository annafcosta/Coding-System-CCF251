module Display(premio_f, p1_f, p2_f, state_f, hex7, hex6, hex5, hex4, ledp1, ledp2, led15);
	input wire [0:1] premio_f;
	input wire [0:3] p1_f, p2_f;
   input wire [0:3] state_f;
   output reg [0:6] hex7, hex6, hex5, hex4;
   output reg [0:1] ledp1, ledp2;
   output reg led15;

    parameter zero   = 7'b0000001,
          um     = 7'b1001111,
          dois   = 7'b0010010,
          tres   = 7'b0000110,
          quatro = 7'b1001100,
          cinco  = 7'b0100100,
          seis   = 7'b0100000,
          sete   = 7'b0001111,
          oito   = 7'b0000000,
          nove   = 7'b0000100,
		  traco  = 7'b1111110, 
          apagado =7'b0000000; 


    always@(*)begin
        case (premio_f)
            2'b01:begin
                ledp1 = 2'b00; 
                ledp2 = 2'b11;
                case (p1_f)
                    0: begin
                        hex7 = zero;
                        hex6 = zero;
                    end
                    1: begin
                        hex7 = zero;
                        hex6 = um;
                    end
                    2: begin
                        hex7 = zero;
                        hex6 = dois;
                    end
                    3: begin
                        hex7 = zero;
                        hex6 = tres;
                    end
                    4: begin
                        hex7 = zero;
                        hex6 = quatro;
                    end
                    5: begin
                        hex7 = zero;
                        hex6 = cinco;
                    end
                    default: begin
                        hex7 = traco;
                        hex6 = traco;
                    end
                endcase
            end
            2'b10:begin
                ledp2 = 2'b00; 
                ledp1 = 2'b11;
                case (p2_f)
                    0: begin
                        hex5 = zero;
                        hex4 = um;
                    end
                    1: begin
                        hex5 = zero;
                        hex4 = um;
                    end
                    2: begin
                        hex5 = zero;
                        hex4 = dois;
                    end
                    3: begin
                        hex5 = zero;
                        hex4 = tres;
                    end
                    4: begin
                        hex5 = zero;
                        hex4 = quatro;
                    end
                    5: begin
                        hex5 = zero;
                        hex4 = cinco;
                    end
                    default: begin
                        hex5 = traco;
                        hex4 = traco;
                    end
                endcase
            end 
            
        endcase
        case (state_f)
           
            4'b0000: begin // acender led 15 quando estiver no estado s0
                led15 = 4'b0000;
            end
            4'b1000: begin // acender os leds p1, p2 e 15 quando estiver no estado de espera (sgx)
                ledp1 = 0;
                ledp2 = 0;
                led15 = 4'b0000;
            end
			default: led15 = 4'b1111;
        endcase
    end
endmodule
