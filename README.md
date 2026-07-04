# Somador/Subtrator de 32 bits

Considere o *template* a seguir para [implementar](top.v) um somador/subtrator de 32 bits:

```verilog
module top (
    input  [31:0] a,
    input  [31:0] b,
    input         sub, // 0 = soma, 1 = subtração
    output [31:0] result,
    output        carry_out, // ~empresta se sub
    output        overflow);



endmodule
```

Isso deve ser feito usando `generate` para instanciar os 32 [somadores completos](full_adder.v). 