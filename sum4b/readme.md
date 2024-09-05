# Sumador de 4 Bits (sum4b) en Verilog

Este módulo Verilog implementa un sumador de 4 bits (`sum4b`) utilizando cuatro instancias de un sumador de 1 bit (`sum1b`).

## Propósito

El módulo `sum4b` realiza la suma aritmética de dos números de 4 bits (`A` y `B`) y genera:

* `Sum`: Un número de 4 bits que representa la suma de `A` y `B`.
* `Cout`: Un bit de acarreo de salida, que indica si hubo un desbordamiento en la suma.

## Estructura

El módulo `sum4b` se construye de la siguiente manera:

1. **Incluye el módulo `sum1b`:** 
   * La línea `include "sum1b.v"` asegura que el código del sumador de 1 bit esté disponible para su uso.

2. **Define el módulo `sum4b`:**
   * `input [3:0] A`: Entrada de 4 bits para el primer número.
   * `input [3:0] B`: Entrada de 4 bits para el segundo número.
   * `output Cout`: Salida de 1 bit para el acarreo.
   * `output [3:0] Sum`: Salida de 4 bits para la suma.

3. **Declara señales internas:**
   * `wire c1, c2, c3`: Señales para los acarreos intermedios entre los sumadores de 1 bit.
   * `wire c_out`: Señal para conectar el acarreo de salida del último sumador de 1 bit a `Cout`.

4. **Instancia cuatro sumadores de 1 bit (`sum1b`):**
   * `s0`, `s1`, `s2`, `s3`: Cuatro instancias del módulo `sum1b` para sumar cada bit de `A` y `B`.
   * Los acarreos se encadenan: el acarreo de salida de un sumador se conecta a la entrada de acarreo del siguiente.
   * El acarreo de salida del último sumador (`s3.Cout`) se asigna a `Cout`.

## Simulación
![Sim1](./sumador_tb.png)

•	Entradas: 
   De 4 bits cada una, etiquetadas como A [3:0] y B [3:0]. Estas representan los números a sumar.

•	Salidas: 
   Sum [3:0]: Representa el resultado de la suma de los 4 bits.

•  Cout: Es el bit de acarreo (carry-out), que indica si hubo un sobrante en 
   la suma.

•	Señales Internas: se aprecian señales internas como c1, c2 y c3, que son los acarreos intermedios entre los sumadores de 1 bit que componen el sumador de 4 bits.

En la forma de onda se muestra cómo cambian las señales a lo largo del tiempo durante un periodo de tiempo de 2 segundos. 

