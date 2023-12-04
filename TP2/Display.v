 module Display(
    input wire clk,
    input wire [0:1] premio_f,
    input wire [0:4] p1_f, p2_f,
    input wire [0:3] state_f,
    output reg [0:6] hex7, hex6, hex5, hex4,
    output reg [0:1] ledp1, ledp2,
    output reg led15,
    output reg sled
);

	 
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
              apagado = 7'b0000000; 
     
    parameter s0 = 4'b0000,
              s1 = 4'b0001,
              s2 = 4'b0010,
              s3 = 4'b0011,
              s4 = 4'b0100,
              sg1 = 4'b0101, // estado de premio 1
              sg2 = 4'b0110, // estado de premio 2
              sg0 = 4'b0111, // estado de premio 0
              sgx = 4'b1000; // estado de espera 
	
	initial begin
        ledp1 = 0;
        ledp2 = 0;
        hex4 = traco;
        hex5 = traco;
        hex6 = traco;
        hex7 = traco;
    end
   
    always @(*) begin
        case (premio_f)
            2'b01:begin
                case (p1_f)
                    4'b0001:begin
                        hex7 = zero;
                        hex6 = um;
                    end
                    4'b0010:begin
                        hex7 = zero;
                        hex6 = dois;
                    end
                    4'b0011:begin
                        hex7 = zero;
                        hex6 = tres;
                    end
                    4'b0100:begin
                        hex7 = zero;
                        hex6 = quatro;
                    end
                    4'b0101:begin
                        hex7 = zero;
                        hex6 = cinco;
                    end
                    4'b0110:begin
                        hex7 = zero;
                        hex6 = seis;
                    end
                    4'b0111:begin
                        hex7 = zero;
                        hex6 = sete;
                    end
                    4'b1000:begin
                        hex7 = zero;
                        hex6 = oito;
                    end
                    4'b1001:begin
                        hex7 = zero;
                        hex6 = nove;
                    end

                    default: begin
                        hex7 = traco;
                        hex6 = traco;
                    end
                endcase
            end
            2'b10: begin
                case (p2_f)
                    4'b0001: begin
                        hex4 = zero;
                        hex5 = um;
                    end
                    4'b0010: begin
                        hex4 = zero;
                        hex5 = dois;
                    end
                    4'b0011: begin
                        hex4 = zero;
                        hex5 = tres;
                    end
                    4'b0100: begin
                        hex4 = zero;
                        hex5 = quatro;
                    end
                    4'b0101: begin
                        hex4 = zero;
                        hex5 = cinco;
                    end
                    4'b0110: begin
                        hex4 = zero;
                        hex5 = seis;
                    end
                    4'b0111: begin
                        hex4 = zero;
                        hex5 = sete;
                    end
                    4'b1000: begin
                        hex4 = zero;
                        hex5 = oito;
                    end
                    4'b1001: begin
                        hex4 = zero;
                        hex5 = nove;
                    end
                    default: begin
                        hex4 = traco;
                        hex5 = traco;
                    end
                endcase
            end  
        endcase
    end
	 
	always @(state_f) begin
          if (state_f == s0) begin
            sled <= 1;
          end else begin
            sled <= ~sled;
          end
		  if(state_f == s4)begin
				led15 <= 1;
		  end else begin
				led15 <= 0;
		  end
    end
endmodule

