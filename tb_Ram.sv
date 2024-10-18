`timescale 1ns/1ps
module tb_Ram;

  // Tạo các biến để kết nối với các cổng của module Word
  reg [7:0] D;   // Đầu vào dữ liệu
  reg w;
  reg [2:0] addr;
  reg en;     // Tín hiệu điều khiển
  wire [7:0] out ;  // Đầu ra của Word

  // Instantiate the Word module
  Ram DUT (
    .D(D),
    .w(w),
    .addr(addr),
    .en(en),
    .out(out)
  );

  // Tạo các trường hợp kiểm tra
  initial begin
    // Khởi tạo
    D = 8'b0;
    addr = 3'b000;
    w = 0;
    en = 0;

    // Ghi vào địa chỉ
    #10;
    D = 8'b1;  // Ghi dữ liệu ví dụ
    addr = 3'b001;
    w = 1;
    en = 1;
    #10;  
    
    //Nếu không nó sẽ bị ghi đè do chưa chuyển kịp dữ liệu mới sẽ ghi vào
    //địa chỉ cũ do chưa kịp giải mã addr sau đó giải mã addr rồi ghi vào địa chỉ mới
    w = 0;
    en = 0;

    
    #10;
    addr = 3'b100;
    w = 1;
    en = 1;
    D = 8'b1011;
    #10;
    w = 0;
    en = 0;

    // Đọc từ địa chỉ 
    #10;
    addr = 3'b001;
    w = 0;
    en = 1;  // Đọc từ RAM
    #10;
    en = 0;

    
    #10;
    addr = 3'b100;
    w = 0;
    en = 1;
    #10;
    en = 0;

    // Kết thúc mô phỏng
    #20;
    $finish;
  end

endmodule
