 module Display(
    input wire clk, reset, 
    input wire [1:0] premio_f,
    input wire [4:0] p1_f, p2_f,
    input wire [3:0] state_f,
    output reg [0:6] hex1, hex0, hex2, hex3,
    output reg [0:1] ledp1, ledp2,
    output reg led15,
    output reg sled,
	 output reg [3:0] gled
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
        ledp1 = 2'b00;
        ledp2 = 2'b00;
        hex3 = traco;
        hex2 = traco;
        hex0 = traco;
        hex1 = traco;
    end
    
   
    always @(*) begin
        if (reset == 1'b1) begin
            ledp1 = 2'b00;
            ledp2 = 2'b00;
            hex3 = traco;
            hex2 = traco;
            hex0 = traco;
            hex1 = traco;
        end
        case (premio_f)
            2'b01:begin // caso premio 1
                ledp1 = 2'b11; // Os leds designados para acender quando o premio 1 é sorteado
                ledp2 = 2'b00;
                case (p1_f) // Nos diplays, é ligado os segmentos correspondente a quantidade de premios sorteados
                    4'b0000:begin
                        hex1 = zero;
                        hex0 = zero;
                    end
                    4'b0001:begin
                        hex1 = zero;
                        hex0 = um;
                    end
                    4'b0010:begin
                        hex1 = zero;
                        hex0 = dois;
                    end
                    4'b0011:begin
                        hex1 = zero;
                        hex0 = tres;
                    end
                    4'b0100:begin
                        hex1 = zero;
                        hex0 = quatro;
                    end
                    4'b0101:begin
                        hex1 = zero;
                        hex0 = cinco;
                    end
                    4'b0110:begin
                        hex1 = zero;
                        hex0 = seis;
                    end
                    4'b0111:begin
                        hex1 = zero;
                        hex0 = sete;
                    end
                    4'b1000:begin
                        hex1 = zero;
                        hex0 = oito;
                    end
                    4'b1001:begin
                        hex1 = zero;
                        hex0 = nove;
                    end

       
                endcase
            end
            2'b10: begin
                ledp1 = 2'b00; // caso o premio 2 seja sorteado, é aceso
                ledp2 = 2'b11;
                case (p2_f)
                    4'b0000:begin
                        hex3 = zero;
                        hex2 = zero;
                        
                    end
                    4'b0001: begin
                        hex3 = zero;
                        hex2 = um;
                    end
                    4'b0010: begin
                        hex3 = zero;
                        hex2 = dois;
                    end
                    4'b0011: begin
                        hex3 = zero;
                        hex2 = tres;
                    end
                    4'b0100: begin
                        hex3 = zero;
                        hex2 = quatro;
                    end
                    4'b0101: begin
                        hex3 = zero;
                        hex2 = cinco;
                    end
                    4'b0110: begin
                        hex3 = zero;
                        hex2 = seis;
                    end
                    4'b0111: begin
                        hex3 = zero;
                        hex2 = sete;
                    end
                    4'b1000: begin
                        hex3 = zero;
                        hex2 = oito;
                    end
                    4'b1001: begin
                        hex3 = zero;
                        hex2 = nove;
                    end
                    
                endcase
            end
            2'b00: begin
                ledp1 = 2'b00;
                ledp2 = 2'b00;
            end  
        endcase
    end
	 
	always @(state_f) begin // é aceso alguns leds para acompanhar o andamento dos estados na FPGA
			 gled <= state_f;
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

