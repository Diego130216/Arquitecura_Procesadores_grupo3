# ¿Qué es el complemento A 2?

El complemento a 2 es un método utilizado en informática para representar números enteros negativos en sistemas binarios. Es ampliamente utilizado en computadoras debido a su simplicidad para realizar operaciones aritméticas, como la adición y la sustracción.

## ¿Cómo Funciona el Complemento a 2?:
1.  Se comienza con la representación binaria del número positivo que se desea convertir a negativo.
2. Se cambia todos los bits de 0 a 1 y de 1 a 0. Este paso le da el complemento a 1.
3. Finalmente, se suma 1 al resultado del complemento a 1. El resultado es el complemento a 2 del número original, que representa su equivalente negativo.

### ejemplo:
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