`include "encode.v"

module encode_display (
  input wire S0,
  input wire S1,
  input wire S2,
  input wire S3,
  input wire ready,
  input wire reset,
  output reg [6:0] segments
);

always @(posedge ready or posedge reset) begin
  if (reset) begin
    // Lógica de reinicialização quando o sinal de reset é acionado
    segments <= 7'b1111111;
  end else begin
    // Lógica para associar os segmentos com base nos sinais de entrada
    case ({S0, S1, S2, S3})
      4'b0000: segments = 7'b1000000; // 0
      4'b0001: segments = 7'b1111001; // 1
      4'b0010: segments = 7'b0100100; // 2
      4'b0011: segments = 7'b0110000; // 3
      4'b0100: segments = 7'b0011001; // 4
      4'b0101: segments = 7'b0010010; // 5
      4'b0110: segments = 7'b0000010; // 6
      4'b0111: segments = 7'b1111000; // 7
      4'b1000: segments = 7'b0000000; // 8
      4'b1001: segments = 7'b0011000; // 9
      default: segments = 7'b1111111; // Desligar todos os segmentos se não houver correspondência
    endcase
  end
end

endmodule