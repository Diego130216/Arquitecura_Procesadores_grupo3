# ¿Qué es el complemento A 2?

El complemento a 2 es un método utilizado en informática para representar números enteros negativos en sistemas binarios. Es ampliamente utilizado en computadoras debido a su simplicidad para realizar operaciones aritméticas, como la adición y la sustracción.

## ¿Cómo Funciona el Complemento a 2?:
1.  Se comienza con la representación binaria del número positivo que se desea convertir a negativo.
2. Se cambia todos los bits de 0 a 1 y de 1 a 0. Este paso le da el complemento a 1.
3. Finalmente, se suma 1 al resultado del complemento a 1. El resultado es el complemento a 2 del número original, que representa su equivalente negativo.

### Ejemplo:
Apatir de lo explicado se representará el numero -10 en complemento a 2

1. Representación binaria del 10 
```
        10 en binario: 0000 1010
```
2. Complemento a 1

```
        10 en binario: 1111 0101
```
3. Complemento a2 
```    
                       1
                1111 0101
              + 0000 0001
              ------------
                1111 0110
```
## Regla General:

El número de bits (n) determina el rango de valores que puedes representar. En un sistema de n bits:

* Números positivos: Desde 0 hasta 2ⁿ⁻¹ - 1.
* Números negativos: Desde -2ⁿ⁻¹ hasta -1.

Se puede utilizar cualquier cantidad de bits para representar un número en complemento a 2, siempre y cuando tenga en cuenta el rango de números que puede representar con esa cantidad de bits. En sistemas de 4 bits, puede trabajar con números en el rango de -8 a 7, lo que puede ser suficiente para muchas aplicaciones simples.


## ¿Cómo se aplica el complemento a 2 en la resta de binarios?

 En complemento a 2, la suma y la resta de números pueden realizarse sin tener que preocuparse por los signos. Un número negativo sumado a su positivo complementario da como resultado 0.

### Ejemplo
Se plantea realizar la resta de 24 - 10 donde su resultado es 14, representada en binario:

1. Representación de los números en binario
```                        
24 en binario = 0001 1000
-10 en binario = 1111 0110

```

2. Operación suma 
```    
                       
                0001 1000
              + 1111 0110
              ------------
                0000 1110
```
3. Número obtenido en decimal
```               
                   842
              0000 1110

              8+4+2=14              
```
Obteniendo así, gracias al complemento a 2, la resta de números binarios a partir de una simple suma binaria.

