module Lot(clk, num, reset, fim, fim_jogo, insere, premio, p1, p2);
  input  clk, reset, fim, fim_jogo, insere; 
  input  [0:3] num;
  output reg [0:1] premio;
  output reg [0:4] p1, p2;
  
  reg [3:0] state; // registrador do estado
  
  // num da loteria: 47019
  parameter s0 = 4'b0000,
    s1  = 4'b0001,
    s2  = 4'b0010,
    s3  = 4'b0011,
    s4  = 4'b0100,
    sg1 = 4'b0101,
    sg2 = 4'b0110,
    sc1 = 4'b0111,
    sc2 = 4'b1000,
    si  = 4'b1001;
  
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
      end else if (insere && (state == s1) && (num == 4'b0111)) begin
        state <= s2;
      end else if (insere && (state == s1) && (num != 4'b0111)) begin
        state <= s0;
      end
      // Adicione mais condições de transição de estado conforme necessário
    end
  end
endmodule
