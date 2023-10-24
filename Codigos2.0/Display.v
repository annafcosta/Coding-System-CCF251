module Display (a, b, c, d, ready, reset, dse, dsd);
	input wire a, b, c, d, ready, reset;
	wire s0, s1, s2, s3;
	output reg [6:0] dse;
	output reg [6:0] dsd;
	Codificador en(.A(a), .B(b), .C(c), .D(d), .ready(ready), .reset(reset), .S0(s0), .S1(s1), .S2(s2), .S3(s3));
	
	
	always @(*) begin
		case ({s3, s2, s1, s0})
			4'b0000: begin 
							dsd = 7'b1111110;
							dse = 7'b0000000;
						end
			4'b0001: begin 
							dsd = 7'b0110000;
							dse = 7'b0000000;
						end
			4'b0010: begin 
							dsd = 7'b1101101;
							dse = 7'b0000000;
						end
			4'b0011: begin 
							dsd = 7'b1111001;
							dse = 7'b0000000;
						end
			4'b0100: begin 
							dsd = 7'b0110011;
							dse = 7'b0000000;
						end
			4'b0101: begin 
							dsd = 7'b1011011;
							dse = 7'b0000000;
						end
			4'b0110: begin 
							dsd = 7'b1011111;
							dse = 7'b0000000;
						end
			4'b0111: begin 
							dsd = 7'b1110000;
							dse = 7'b0000000;
						end
			4'b1000: begin 
							dsd = 7'b1111111;
							dse = 7'b0000000;
						end
			4'b1001: begin 
							dsd = 7'b1110011;
							dse = 7'b0000000;
						end
			4'b1010: begin
							dsd = 7'b0110000;
							dse = 7'b1111110;
						end
			4'b1011: begin 
							dsd = 7'b0110000;
							dse = 7'b0110000;
						end
			4'b1100: begin
							dsd = 7'b1101101;
							dse = 7'b0110000;
						end
			4'b1101: begin
							dsd = 7'b1111001;
							dse = 7'b0110000;
						end
			4'b1110: begin 
							dsd = 7'b0110011;
							dse = 7'b0110000;
						end
			4'b1111: begin
							dsd = 7'b1011011;
							dse = 7'b0110000;
						end
			default: begin 
							dsd = 7'b0000000;
							dse = 7'b0000000;
						end
		endcase
	
	end
	

endmodule
