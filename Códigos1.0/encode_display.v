`include "encode.v"

module display (
  input wire S0,
  input wire S1,
  input wire S2,
  input wire S3,
  input wire ready,
  output reg reset,
  output reg a,
  output reg b,
  output reg c,
  output reg d,
  output reg e,
  output reg f,
  output reg g
);

reg [6:0] segments; // Adicionando a declaração correta aqui

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

always @(posedge ready) begin
  // Atribuição condicional com base em 'segments'
  {a, b, c, d, e, f, g} <= (segments == 7'b1000000) ? 7'b0111111 :
                           (segments == 7'b1111001) ? 7'b0000110 :
                           (segments == 7'b0100100) ? 7'b1011011 :
                           (segments == 7'b0110000) ? 7'b1001111 :
                           (segments == 7'b0011001) ? 7'b1100110 :
                           (segments == 7'b0010010) ? 7'b1101101 :
                           (segments == 7'b0000010) ? 7'b1111101 :
                           (segments == 7'b1111000) ? 7'b0000111 :
                           (segments == 7'b0000000) ? 7'b1111111 :
                           (segments == 7'b0011000) ? 7'b1110111 :
                           7'b1111111; // Default, desligar todos os segmentos
end
endmodule
