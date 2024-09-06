## Documentación

# ¿Cómo Funciona el Código del Multiplicador de 3 Bits?

Este código define un módulo llamado `multiplicador` que implementa un multiplicador secuencial de 3 bits. Utiliza una Máquina de Estados Finitos (FSM) para controlar los diferentes pasos del proceso de multiplicación binaria, incluyendo la suma de productos parciales y el desplazamiento (shift) de registros.

# Explicación Paso a Paso

## 1. Definición del Módulo:

El módulo en Verilog encapsula la lógica del multiplicador y define sus entradas y salidas:

### Entradas:

+ `clk`: Señal de reloj para la sincronización de las operaciones.
+ `init`: Señal que inicia el proceso de multiplicación.
+ `MR`: Registro de 3 bits que representa el multiplicando.
+ `MD`: Registro de 3 bits que representa el multiplicador.

### Salidas:

+ `done`: Señal que indica cuando la operación de multiplicación ha terminado.
+ `pp`: Producto parcial de 6 bits, que contiene el resultado final de la multiplicación.

## 2. Variables Internas:

Dentro del módulo se definen algunas variables adicionales:

reg sh;
reg rst;
reg add;
reg [5:0] A;
reg [2:0] B;
wire z;
reg [2:0] status;


### Descripción:

+ `sh`, `rst`, `add`: Señales de control que determinan si se debe desplazar (shift), reiniciar (reset) o sumar.
+ `A`: Registro que contiene el multiplicador desplazado y se usa para almacenar el resultado de los productos parciales.
+ `B`: Registro que contiene el multiplicando y que se irá desplazando a medida que avanza la multiplicación.
+ `z`: Señal que indica si el valor de `B` es 0, lo cual marca el fin de la multiplicación.
+ `status`: Variable de 3 bits que representa el estado actual de la máquina de estados.

## 3. Estados de la FSM (Máquina de Estados Finita)

La FSM se mueve a través de los siguientes estados:

```verilog
parameter START = 0, CHECK = 1, ADD = 2, SHIFT = 3, END1 = 4;
```

### Estados:

1. **START**: Estado inicial donde se espera la señal de inicio (`init`).
2. **CHECK**: Verifica el bit menos significativo de `B` para decidir si se debe sumar o pasar al siguiente estado.
3. **ADD**: Realiza la suma del producto parcial.
4. **SHIFT**: Desplaza los registros `A` y `B`.
5. **END1**: Indica que la multiplicación ha finalizado.

## 4. Transiciones de Estados

El siguiente bloque `always` describe la lógica de transición entre los estados, que se ejecuta en el flanco negativo del reloj (`negedge clk`):


### Transiciones Clave:

- En el estado **START**, el sistema espera la señal de inicio (`init`).
- En el estado **CHECK**, se verifica el bit menos significativo de `B` para decidir si se debe sumar.
- En el estado **ADD**, se realiza la suma si es necesario.
- En el estado **SHIFT**, los registros `A` y `B` se desplazan.
- El estado **END1** indica que la multiplicación ha finalizado y se activa la señal `done`.

## 5. Desplazamiento y Reinicialización

Este bloque se encarga de manejar los registros de desplazamiento `A` y `B`:

```verilog
always @(posedge clk) begin
    if (rst) begin
        A <= {3'b000, MD};
        B <= MR;
    end
    else begin 
        if (sh) begin
            A <= A << 1;
            B <= B >> 1;
        end
    end
end
```

### Explicación:

- **Reinicialización**: Cuando la señal `rst` está activa, `A` se inicializa con el valor de `MD` y `B` con el valor de `MR`.
- **Desplazamiento**: Si la señal `sh` está activa, `A` se desplaza hacia la izquierda y `B` hacia la derecha. Esto emula el proceso de multiplicación binaria.

## 6. Suma de Productos Parciales

Este bloque se encarga de sumar los productos parciales cuando la señal `add` está activa:

```verilog
always @(posedge clk) begin
    if (rst) begin
        pp <= 6'b0;
    end
    else begin 
        if (add) begin
            pp <= pp + A;
        end
    end
end
```

### Explicación:

- **Reinicio**: Cuando la señal `rst` está activa, `pp` se reinicia a 0.
- **Suma**: Si la señal `add` está activa, se suma el valor de `A` al acumulador `pp`, lo que construye el producto final.

## 7. Comparador de Finalización

Este bloque compara si `B` ha llegado a cero:

```verilog
assign z = (B == 0) ? 1'b1 : 1'b0;
```

### Explicación:

- Si `B` es igual a 0, la señal `z` se activa, lo que indica que la multiplicación ha terminado y la FSM puede moverse al estado `END1`.

---

## Simulación :
![imagen1](/imagenes/simulacion_multi_1.png)
![imagen2](/imagenes/simulacion_multi_2.png)
![imagen3](/imagenes/simulacion_multi_3.png)

