module tri_state(
	input wire D,
	input wire se,
	output reg Q
);
always @(*) begin
    if (se)
        Q = D;
    else
        Q = 1'bz;
end
endmodule