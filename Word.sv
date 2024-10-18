module Word(
	input wire [7:0] D,
	input wire w,
	input wire cs,
	output wire [7:0] Q
);
wire [1:0]c;
wire [15:0] Qi;

Dlatch d7(.D(D[7]), .en(c[0]), .Q(Qi[7]));
tri_state tr7(.D(Qi[7]), .se(c[1]), .Q(Q[7]));

Dlatch d6(.D(D[6]), .en(c[0]), .Q(Qi[6]));
tri_state tr6(.D(Qi[6]), .se(c[1]), .Q(Q[6]));

Dlatch d5(.D(D[5]), .en(c[0]), .Q(Qi[5]));
tri_state tr5(.D(Qi[5]), .se(c[1]), .Q(Q[5]));

Dlatch d4(.D(D[4]), .en(c[0]), .Q(Qi[4]));
tri_state tr4(.D(Qi[4]), .se(c[1]), .Q(Q[4]));

Dlatch d3(.D(D[3]), .en(c[0]), .Q(Qi[3]));
tri_state tr3(.D(Qi[3]), .se(c[1]), .Q(Q[3]));

Dlatch d2(.D(D[2]), .en(c[0]), .Q(Qi[2]));
tri_state tr2(.D(Qi[2]), .se(c[1]), .Q(Q[2]));

Dlatch d1(.D(D[1]), .en(c[0]), .Q(Qi[1]));
tri_state tr1(.D(Qi[1]), .se(c[1]), .Q(Q[1]));

Dlatch d0(.D(D[0]), .en(c[0]), .Q(Qi[0]));
tri_state tr0(.D(Qi[0]), .se(c[1]), .Q(Q[0]));

assign c[0]= cs&w;
assign c[1]= (~w)&cs;
endmodule