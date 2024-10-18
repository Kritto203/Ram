module Ram( 
	input wire[7:0] D,
	input wire [2:0] addr,
	input wire en,
	input wire w,
	output wire[7:0] out 
);
wire[7:0]c;
wire [7:0] out_w[7:0];
decoder3_8 d0(.en(en), .A(addr), .Y(c));

Word w1(.D(D), .w(w), .cs(c[7]), .Q(out_w[7]));
Word w2(.D(D), .w(w), .cs(c[6]), .Q(out_w[6]));
Word w3(.D(D), .w(w), .cs(c[5]), .Q(out_w[5]));
Word w4(.D(D), .w(w), .cs(c[4]), .Q(out_w[4]));
Word w5(.D(D), .w(w), .cs(c[3]), .Q(out_w[3]));
Word w6(.D(D), .w(w), .cs(c[2]), .Q(out_w[2]));
Word w7(.D(D), .w(w), .cs(c[1]), .Q(out_w[1]));
Word w8(.D(D), .w(w), .cs(c[0]), .Q(out_w[0]));

    // Chọn từ được đọc dựa trên địa chỉ
assign out =  (c[7]) ? out_w[7] : 
              (c[6]) ? out_w[6] : 
              (c[5]) ? out_w[5] : 
              (c[4]) ? out_w[4] : 
              (c[3]) ? out_w[3] : 
              (c[2]) ? out_w[2] : 
              (c[1]) ? out_w[1] : 
              (c[0]) ? out_w[0] : 16'bz;


endmodule 