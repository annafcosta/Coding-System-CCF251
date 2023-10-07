
/*
Declaração do Modulo
Codificador
*/

module Modulo_codificador (bit0, bit1, bit2, bit3, s0, s1, s2, s3);
	//Declaração das Entradas/Saidas
	input bit0, bit1, bit2, bit3;
	output s0, s1, s2, s3;
	
	
	// Declaração do funcionamento do circuito
	
	s3 = (~bit0 & ~bit2 & ~bit3) | (~bit1 & ~bit3) | (~bit0 & bit1 & bit3) | (bit0 & ~bit1 & ~bit2);




endmodule	