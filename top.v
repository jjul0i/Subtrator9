module top (
    input  [31:0] a,
    input  [31:0] b,
    input         sub,
    output [31:0] result,
    output        carry_out,
    output        overflow
);

wire [31:0] bx;
wire [32:0] c;

assign bx = b ^ {32{sub}};
assign c[0] = sub;

genvar i;
generate
    for (i = 0; i < 32; i = i + 1) begin : fa
        full_adder U (
            .a(a[i]),
            .b(bx[i]),
            .cin(c[i]),
            .s(result[i]),
            .cout(c[i+1])
        );
    end
endgenerate

assign carry_out = c[32];
assign overflow = c[31] ^ c[32];

endmodule


module full_adder (
    input  a, b, cin,
    output s, cout
);

assign s = a ^ b ^ cin;
assign cout = (a & b) | (cin & (a ^ b));

endmodule
