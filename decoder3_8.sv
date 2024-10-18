module decoder3_8 (
    input wire en,
    input wire [2:0] A,
    output reg [7:0] Y
);

always @(*) begin
    if (en) begin
        case (A)
            3'b000: Y = 8'b0000_0001;
            3'b001: Y = 8'b0000_0010;
            3'b010: Y = 8'b0000_0100;
            3'b011: Y = 8'b0000_1000;
            3'b100: Y = 8'b0001_0000;
            3'b101: Y = 8'b0010_0000;
            3'b110: Y = 8'b0100_0000;
            3'b111: Y = 8'b1000_0000;
            default: Y = 8'bxxxx_xxxx;
        endcase
    end else begin
        Y = 8'b0;
    end
end

endmodule 
