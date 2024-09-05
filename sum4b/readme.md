# Sumador de 4 Bits [sum4b](/sum4b/sum4b.v) en Verilog

Este módulo es donde cuatro piezas más pequeñas se unen para crear una más grande y poderosa.

El módulo `sum4b` suma dos números de 4 bits, como sumar números en una pequeña calculadora.

* `suma`: un número de 4 bits que suma `a` y `b`. Si la suma supera el límite, el bit de acarreo de salida se establecerá en 1.

El módulo `sum4b`.

1. ** Módulo `sum1b`:**

 Este módulo es el mismo que se detalla en [sum1b](/sum1b/readme.md) ahi se puede apreciar más su funcionamiento.
  
El módulo `sum4b` es una colección de funciones que nos ayudan a realizar cálculos y resolver problemas relacionados con números.
```
    module sum4b (
            input  [3:0] A,
            input  [3:0] B,
            output       Cout,
            output [3:0] Sum
        );
```

* `input [3:0] a`: entrada de 4 bits para el primer número
* `input [3:0] b`: entrada de 4 bits para el segundo número
* `output cout`: salida de 1 bit para acarreo
* `salida [3:0] suma`: salida de 4 bits para suma

Declarar señales internas:
```
    wire c1,c2,c3;
    wire c_out; 

```
* `wire c1, c2, c3`: Señales para los acarreos intermedios entre los sumadores de 1 bit.
* `wire c_out`: Señal para conectar el acarreo de salida del último sumador de 1 bit a `Cout`.

4. **Instancia de cuatro sumadores de 1 bit (`sum1b`):**
```
    sum1b s0 (.A(A[0]), .B(B[0]), .Ci(1'b0),  .Cout(c1) ,.Sum(Sum[0]));
    sum1b s1 (.A(A[1]), .B(B[1]), .Ci(c1), .Cout(c2) ,.Sum(Sum[1]));
    sum1b s2 (.A(A[2]), .B(B[2]), .Ci(c2), .Cout(c3) ,.Sum(Sum[2]));
    sum1b s3 (.A(A[3]), .B(B[3]), .Ci(c3), .Cout(Cout) ,.Sum(Sum[3]));
```
* `s0`, `s1`, `s2`, `s3`: Cuatro instancias del módulo `sum1b` para sumar cada bit de `A` y `B`.
* Los acarreos están encadenados: el acarreo de salida de un sumador está conectado a la entrada de acarreo del siguiente.
* El acarreo de salida del último sumador (`s3.Cout`) se asigna a `Cout`.

## Simulación

![Sim1](./sumador_tb.png)

• Entradas:
4 bits cada uno, etiquetados A [3:0] y B [3:0]. Estos representan los números a sumar.

• Salidas:
Suma [3:0]: Representa el resultado de la suma de los 4 bits.

• Cout: Es el bit de acarreo, que indica si hubo excedente en
la suma.

• Señales Internas: se pueden observar señales internas como c1, c2 y c3, que son los acarreos intermedios entre los sumadores de 1 bit que conforman el sumador de 4 bits.

La forma de onda muestra cómo las señales cambian con el tiempo durante un período de 2 segundos.
