module Dlatch(
	input wire D,
	input wire en,
	output reg Q
);
always @(*) begin
	if(en)
    	Q <= D;
end
endmodule 