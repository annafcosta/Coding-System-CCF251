module Display (a, b, c, d, ready, reset, dse, dsd);
    input wire a, b, c, d, ready, reset;
    wire s0, s1, s2, s3;
    output reg [0:6] dse; // display esquerdo (Hex[1])
    output reg [0:6] dsd; // display direito (Hex[0])
    Codificador en(.A(a), .B(b), .C(c), .D(d), .Ready(ready), .Reset(reset), .S0(s0), .S1(s1), .S2(s2), .S3(s3));
    
    always @(*) begin
        case ({reset, s3, s2, s1, s0, ready})
            6'b000001: begin 
                            dsd = ~7'b1111110;
                            dse = ~7'b0000000;
                        end
            6'b000011: begin 
                            dsd = ~7'b0110000;
                            dse = ~7'b0000000;
                        end
            6'b000101: begin 
                            dsd = ~7'b1101101;
                            dse = ~7'b0000000;
                        end
            6'b000111: begin 
                            dsd = ~7'b1111001;
                            dse = ~7'b0000000;
                        end
            6'b001001: begin 
                            dsd = ~7'b0110011;
                            dse = ~7'b0000000;
                        end
            6'b001011: begin 
                            dsd = ~7'b1011011;
                            dse = ~7'b0000000;
                        end
            6'b001101: begin 
                            dsd = ~7'b1011111;
                            dse = ~7'b0000000;
                        end
            6'b001111: begin 
                            dsd = ~7'b1110000;
                            dse = ~7'b0000000;
                        end
            6'b010001: begin 
                            dsd = ~7'b1111111;
                            dse = ~7'b0000000;
                        end
            6'b010011: begin 
                            dsd = ~7'b1110011;
                            dse = ~7'b0000000;
                        end
            6'b010101: begin
                            dsd = ~7'b1111110;
                            dse = ~7'b0110000;
                        end
            6'b010111: begin 
                            dsd = ~7'b0110000;
                            dse = ~7'b0110000;
                        end
            6'b011001: begin
                            dsd = ~7'b1101101;
                            dse = ~7'b0110000;
                        end
            6'b011011: begin
                            dsd = ~7'b1111001;
                            dse = ~7'b0110000;
                        end
            6'b011101: begin 
                            dsd = ~7'b0110011;
                            dse = ~7'b0110000;
                        end
            6'b011111: begin
                            dsd = ~7'b1011011;
                            dse = ~7'b0110000;
                        end
            default: begin 
                            if (reset == 1'b1 || ready == 1'b0 || (ready == 1'b0 && reset == 1'b1)) begin // Caso a entrada ready ou reset for acionada, acender somente a saida c6 do display
                                dsd = ~7'b0000001;
                                dse = ~7'b0000001;
                            end
                            else begin
                                dsd = ~7'b0000000; // caso nenhuma das posibilidades, desligar o display
                                dse = ~7'b0000000;
                            end
                     end
        endcase
    end
endmodule
