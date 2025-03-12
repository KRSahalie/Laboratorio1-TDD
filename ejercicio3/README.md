# Ejercicio 3: Decodificador para display de 7 segmentos
## Planteamiento del  ejercicio (Parte 1):

La primera parte del decodificador consiste en definir uno o varios módulos que reciban un valor binario representado por 4 bits y devuelva su representación hexadecimal. El decodificador es un circuito combinacional, es decir que las salidas solo dependen de las entradas y no de un estado anterior, una combinación de entrada entregará una salida específica por lo que se pueden igualar o asignar las variables entre sí. Para realizar esa tarea se utiliza la tabla de conversión de binaria 4 bits a hexadecimal. Además recordando que la salida quiere ser representada en un display de 7 segmentos, se investiga el funcionamiento del display de la FPGA a utilizar (Basys 3) y se determina que es de ánodo común por lo que un estado activo no será representado o establecido por un valor de "1" si no que con un "0" y el apagado con un "0" en lugar de un "1", de manera inversa al display que utiliza cátodo común. Con esta información se procede a  crear una tabla que relacione el número valor de entrada con su representación en hexadecimal y los segmentos activos/desactivados del display en la FPGA. Se acalara que el orden en los segmentos es de : 7'b abcdefg.

## Tabla de conversión múltiple:

La siguiente tabla muestra la relación entre los números decimales, su representación binaria de 4 bits, su equivalente hexadecimal y los segmentos activos en el display de 7 segmentos.

<div align="center">
  
| Decimal    | Binario | Hexadecimal   | Display |
| --------- | ---- | -------- |-------- |
| 0      | 0000   | 0   | 7'b0000001|
| 1     | 0001   | 1|7'b1001111|
| 2      | 0010   | 2   |7'b0010010|
| 3     | 0011   | 3|7'b0000110|
| 4      | 0100   | 4   |7'b1001100|
| 5     | 0101   | 5|7'b0100100|
| 6      | 0110   | 6   |7'b0100000|
| 7     | 0111   | 7|7'b0001111|
| 8      | 1000   | 8   |7'b0000000|
| 9     | 1001   | 9|7'b0000100|
| 10      | 1010   | A   |7'b0001000|
| 11     | 1011   | B|7'b1100000|
| 12      | 1100   | C   |7'b0110001|
| 13     | 1101   | D|7'b1000010|
| 14      | 1110   | E   |7'b0110000|
| 15    | 1111   | F|7'b0111000|

</div>

Antes de empezar con el desarrollo del ejercicio se crea un diagrama de bloques para representar el orden del circuito combinacional, para ello se identifican las entradas y salidas, ademas de la lógica para llegar al resultado. 

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio3/Imagenes/Diagrama%20de%20bloques%20Parte%201.png" alt="Diagrama de bloques Parte 1">
</div>

## Planteamiento del  ejercicio (Parte 2):

La segunda parte del ejercicio del decodificador consiste en modificar el primer diseño de manera que los 16 switches totales se separen en grupos de 4 switches y con los botones se decida como moverse entre los displays. Para solucionar esta parte se piensa en 2 maneras distintas, la primera utiliza 4 botones, 1 asignado a un display distinto de manera que cuando se presione solamente se obtengan datos de sus switches específicos y la segunda solución es utilizar 2 botones que hagan que los display cambian hacia un lado o hacia el otro. Para ambos diseños se agrega un multiplexor 4 a 1 para poder multiplexar los switches de cada caso y para implementar el resto se piensa agregar lógica de compuertas OR en la primera opción de 4 botones, uno con cada display y para la segunda opción otro multiplexor para encender el ánodo específico que es movido por un contador interno que se mueve de 0 a 3. 

Antes de empezar con el desarrollo del ejercicio se crea un diagrama de bloques para representar el orden del circuito combinacional, para ello se identifican las entradas y salidas, ademas de la lógica para llegar al resultado. 

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio3/Imagenes/Diagrama%20de%20bloques%20parte%202.png">
</div>

## Tabla de conversión múltiple:

La siguiente tabla muestra la tabla de verdad del selector para el multiplexor.

<div align="center">
  
| btn[3]    | btn[2] | btn[1]    |s[0] | s[1]|
| --------- | ---- | --------  |----- |----- |
| 0      | 0        | 0       |X      |X |
| 0      | 0        | 1       |      0|  1   |
| 0      | 1        | 0      |      1 |  0 |
| 1      | 0        | 0     |      1 |   1|


</div>







