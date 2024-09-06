 ## Documentación
 # ¿Cómo Funciona el Código de Sumador de 1 Bit?

Este código define un módulo llamado `sum1b`, que representa un sumador de 1 bit con acarreo. Los sumadores de 1 bit son bloques básicos utilizados en circuitos aritméticos, como los sumadores completos, que suman dos números binarios.

# Explicación [sum1b](sum1b.v)

 ## 1. Definición del Módulo:

Un módulo en Verilog encapsula una parte del diseño del hardware, que puede ser tan simple como una puerta lógica o tan complejo como un microprocesador. Dentro del módulo, se puede definir las entradas y salidas, los comportamientos y la lógica que se necesita para implementar una funcionalidad específica. En este código el modulo recibe el nombre de `sum1b`

Las entradas se asignan con la palabra reservada `input` seguido del nombre que se desea en este caso las entradas serán `A` y `B` caso similar ocurre con la salida, tan solo que se usa la palabra reservada `output` las salidas en este codigo son `sum` y `Cout`. En un módulo Verilog, si una entrada o salida se declara sin un rango de bits, se considera que es de 1 bit. En este caso, tanto `A` como `B` son señales de 1 bit.

Para hacer que una entrada, salida o una variable interna sea de más de 1 bit, se debe especificar un rango de bits entre corchetes `[]`. El formato general es: 
```
[input/output/variable] [n:0] nombre;
```
Donde, n:0: Define el rango de bits. n es el bit más significativo (MSB, por sus siglas en inglés) y 0 es el bit menos significativo (LSB, por sus siglas en inglés). Si n es igual a 3, por ejemplo, entonces la variable tendrá 4 bits (3, 2, 1, 0).

Una variable importante para el [sumador de 4 bits](/sum4b/sum4b.v) es la entrada `Ci`: El bit de acarreo de entrada, que es el acarreo que viene de una suma anterior (si estuvieras sumando múltiples bits). Esta entrada se detallará en la explicación del codigo de sumador de 4b. Con todo lo anterior se aclara que: 

   + `A` y `B`: Los dos bits que se quieren sumar.
   + `Ci`: El bit de acarreo de entrada, que es el acarreo que viene de una suma anterior.
   + `sum`: El resultado de la suma de `A`, `B` y `Ci`.
   + `Cout`: El bit de acarreo de salida, que se envía al siguiente dígito de mayor orden en una suma binaria de varios bits.

## 2. Declaración de una Variable Interna:
```
reg [1:0] result: 
```
Esta línea declara una variable llamada result que puede almacenar dos bits (ya que el tamaño está definido por [1:0]). Esta variable almacenará el resultado de la suma. reg indica que `result` puede cambiar su valor a lo largo del tiempo y es utilizada dentro de un bloque secuencial como el que veremos.

 ## 3. Asignación de las Salidas:
```
    assign Sum = result[0];
    assign Cout = result[1];
```
+ `assign`: Esta palabra clave se usa para asignar valores a señales de salida.

+ `Sum = result[0]`: Aquí, se está asignando el primer bit (`result[0]`) de `result` al `Sum`. Este bit es el resultado de la suma.
+ `Cout = result[1]`: Aquí, se está asignando el segundo bit (`result[1]`) de `result` a `Cout`, que es el bit de acarreo de salida.

Esta parte del código tiene relevancia cuando hacemos una suma binaria de 1 + 1 esto siempre da como resultado 10.

###    Suma Binaria Básica

En aritmética binaria:
```
0 + 0 = 0
0 + 1 = 1
1 + 0 = 1
1 + 1 = 10 (que es 2 en decimal)

```
La operación 1 + 1 es especial porque el resultado no cabe en un solo bit. En binario, 1 + 1 genera un resultado de "10".

+ El "0" es el resultado de la suma (Sum).
+ El "1" es el acarreo (Carry Out).

Esto es importante porque sin manejar correctamente el acarreo, no se podría realizar sumas binarias correctas. Por ejemplo, en un sumador de 4 bits, el acarreo de un bit menos significativo podría afectar el siguiente bit.

## 4. El Bloque always:
```
    always@(*) begin
      result = A+B+Ci;
    end
```
* `always@(*)`: Este bloque indica que el código dentro de él se ejecutará siempre que cambie alguna de las señales de entrada (`A`, `B`, o `Ci`). El asterisco `(*)` es un comodín que significa "escuchar cambios en cualquiera de las señales de entrada".
+ `result = A + B + Ci;`: Aquí es donde ocurre la suma. El código suma `A`, `B`, y `Ci`, y almacena el resultado en `result`. Como `result` tiene dos bits, puede almacenar tanto el bit de suma (Sum) como el bit de acarreo (Cout).
+ `begin` y `end`: Delimitan el bloque de código que se ejecuta dentro del bloque always.

# Explicación [sum1b_primitive](sum1b_primitive.v)
Primero, aclaremos la tabla de verdad para el sumador de un bit:

![tabla](/imagenes/tabla_de_verdad.png)


# Análisis de Mapas de Karnaugh para Circuitos de Suma y Acarreo

Se explica el análisis de mapas de Karnaugh para las funciones de suma `S` y acarreo `Cout` en un circuito de suma de bits. A continuación se detalla el procedimiento y las conclusiones.

## 1. Mapa de Karnaugh para S (Sum)

La función `S` indica la suma de los bits `A`, `B`, y `Ci` sin considerar el acarreo. Colocamos 1 en las celdas donde , `S` es 1 en la [tabla de verdad](/imagenes/tabla_de_verdad.png).

`S` = 1 cuando (A, B, Ci) es (0, 0, 1), (0, 1, 0), (1, 0, 0), y (1, 1, 1).

La tabla de Karnaugh para , `S` es:

| Ci \ AB | 00 | 01 | 11 | 10 |
|---------|----|----|----|----|
|    0    |  0 |  1 |  0 |  1 |
|    1    |  1 |  0 |  1 |  0 |

Para **S**, el K-map muestra que esta es la función de una XOR a tres entradas:

S= A ⊕ B ⊕ Ci

Esto ocurre porque la salida es 1 cuando un número impar de entradas es 1.

## 2. Mapa de Karnaugh para Cout (Carry-out)

La función `Cout` indica el acarreo generado. Colocamos 1 en las celdas donde `Cout` es 1 en la tabla de verdad.

``Cout`` = 1 cuando (A, B, Ci) es (0, 1, 1), (1, 0, 1), (1, 1, 0), y (1, 1, 1).

La tabla de Karnaugh para ``Cout`` es:

| Ci \ AB | 00 | 01 | 11 | 10 |
|---------|----|----|----|----|
|    0    |  0 |  0 |  1 |  0 |
|    1    |  0 |  1 |  1 |  1 |

Observamos que las combinaciones donde ``Cout`` = 1 corresponden a situaciones en las que al menos dos de las entradas son 1. Esto se refleja en la siguiente expresión, que es el resultado de simplificar el K-map:

Cout= Ci ⋅ (A ⊕ B)+ A ⋅ B 

## Resumen y Conclusión

- ``Suma (S)``: Utilizando un mapa de Karnaugh, derivamos que ``S ``se puede representar como una operación XOR entre ``A``, ``B``, y ``Ci``. Esto se debe a que la suma sin acarreo es 1 cuando un número impar de entradas es 1.

- ``Acarreo (Cout)``: Mediante otro mapa de Karnaugh, llegamos a la conclusión de que ``Cout`` se puede expresar como una suma lógica (OR) de las combinaciones AND de las entradas. Esto refleja que `` Cout`` es 1 cuando dos o más entradas son 1.




# Simulación
La simulación es una etapa crucial en cualquier proceso de implementación de software para hardware, ya que permite identificar y corregir errores antes de realizar cambios físicos en el hardware. Este proceso es fundamental para garantizar que el diseño funcione correctamente en un entorno controlado antes de su implementación en un dispositivo real.

En este contexto, el uso de un testbench se vuelve indispensable. Un testbench es un entorno de pruebas que permite simular y verificar el comportamiento del diseño bajo prueba (DUT, por sus siglas en inglés). Mediante el testbench, es posible generar y aplicar una serie de señales de entrada al código que se está simulando, observando las respuestas y salidas generadas por el sistema. Esta metodología no solo facilita la detección de fallas y errores lógicos, sino que también permite confirmar que el diseño cumple con las especificaciones requeridas, asegurando que todas las señales y operaciones se ejecuten como se espera. De este modo, la simulación con un testbench no solo mejora la calidad y fiabilidad del diseño, sino que también optimiza el proceso de desarrollo al reducir el riesgo de errores costosos en etapas posteriores.

## 1. Sumador de un Bit Usando Primitivas [(sum1b_primitive)](sum1b_primitive.v)

 Este sumador utiliza puertas lógicas básicas (primitivas) para realizar la operación de suma de un bit. Las primitivas en Verilog suelen incluir elementos fundamentales como puertas AND, OR, NOT, entre otras.

 #### Ventajas:
* Eficiencia: Dado que este enfoque utiliza primitivas, es más directo y optimizado para la síntesis en hardware. Cada puerta lógica está representada de manera explícita, lo que permite un control preciso sobre la implementación.

* Predecibilidad: Las primitivas ofrecen un comportamiento consistente y bien definido en términos de retardo y consumo de recursos.

 #### Desventajas:
* Complejidad de diseño: Puede volverse complicado si necesitas implementar funciones más complejas, ya que todo debe ser descompuesto en sus componentes lógicos más básicos.

 #### Resultados en GTKWave: 
Según la imagen de simulación, los resultados en las señales Cout y S corresponden correctamente con la tabla de verdad de un sumador de un bit.

![imagen1](/imagenes/sum1b_primitive_tb.png)


## 2. Sumador de un Bit Usando Registros y Bloques always [(sum1b)](sum1b.v)

En esta implementación, se utiliza un bloque always que contiene una asignación combinacional utilizando un registro (result) para almacenar la suma y el acarreo. Las señales de salida se derivan de este registro.

#### Ventajas:
* Simplicidad en la codificación: Este enfoque es más sencillo de entender y modificar, especialmente cuando se desea extender la funcionalidad, como para sumar más bits o agregar características adicionales.

* Flexibilidad: Permite el uso de construcciones de lenguaje más complejas que no se limitan a puertas lógicas básicas.
Desventajas:

* Potencial para ineficiencias: Dependiendo de cómo se implemente y sintetice el código, podría no ser tan eficiente como el enfoque basado en primitivas, especialmente si no se optimiza adecuadamente.

* Comportamiento dependiente de la síntesis: Las herramientas de síntesis podrían optimizar el código de manera diferente, lo que podría afectar el rendimiento en términos de retardo y consumo de área en el circuito final.

#### Resultados en GTKWave: 
Los resultados en GTKWave también muestran que las salidas Cout y S coinciden con la tabla de verdad de un sumador de un bit, lo que indica que la implementación es funcional.

![imagen1](/imagenes/sum1b_tb.png)

### Comparación y Conclusiones

* Precisión: Ambos enfoques son capaces de producir el resultado correcto en la simulación para un sumador de un bit, cumpliendo con la tabla de verdad proporcionada.

* Eficiencia vs. Flexibilidad: El enfoque con primitivas es generalmente más eficiente y está más orientado a la síntesis directa en hardware, mientras que el uso de registros y bloques always ofrece mayor flexibilidad y facilidad de implementación a nivel de código.

* Aplicaciones: Para proyectos donde la eficiencia y la optimización del hardware son cruciales, el uso de primitivas es más adecuado. En cambio, para proyectos donde se espera expandir o modificar el diseño fácilmente, el enfoque basado en registros y bloques always podría ser más conveniente.

## Driagramas en Quartus

Para realizar la comparación entre la descripción HDL y la implementación física en compuertas lógicas, se ha utilizado un sumador de 1 bit como ejemplo. El proceso consiste en dos etapas principales: primero, la implementación en código de hardware descriptivo (HDL), y segundo, la visualización de la red lógica en el entorno de desarrollo Quartus.

### 1. Diagrama del Sumador de 1 Bit en HDL

El primer diagrama representa la descripción del sumador de 1 bit utilizando un lenguaje de descripción de hardware (HDL). En este código HDL, se define el sumador de 1 bit con las siguientes entradas:

* A: Primer bit de entrada
* B: Segundo bit de entrada
* Cin: Bit de acarreo de entrada
* Sum: Resultado de la suma
* Cout: Bit de acarreo de salida

![hdl](/imagenes/sum1b_quartus.png)

## 2. Diagrama del Sumador de 1 Bit con Compuertas Lógicas
El segundo diagrama representa la implementación física del sumador de 1 bit utilizando compuertas lógicas básicas. Este diagrama muestra cómo las entradas ``A``, ``B`` y ``Cin`` se combinan utilizando compuertas XOR, AND y OR para obtener la salida ``S`` y el acarreo de salida ``Cout``. La descripción en compuertas lógicas es la siguiente:

![compuertas](/imagenes/sum1b_primitive_quartus.png)

Ambos diagramas proporcionarán una representación visual del diseño del sumador de 1 bit, facilitando la comparación entre la descripción en HDL y la implementación física.

# Referencias 
[1] D. Natali, "ECCI Arquitectura de Procesadores 2024-II," Repositorio en GitHub, 2024. [En línea]. Disponible en: https://github.com/DianaNatali/ECCI-Arquitectura-de-Procesadores-2024-II.git.



