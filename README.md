
## 1. Abreviaturas y definiciones
- **FPGA**: Field Programmable Gate Arrays
- **FA**: Full Adder
- **RCA**: Ripple Carry Adder
- **CLA**: Carry Look-ahead Adder

## 2. Referencias
[0] David Harris y Sarah Harris. *Digital Design and Computer Architecture. RISC-V Edition.* Morgan Kaufmann, 2022. ISBN: 978-0-12-820064-3

[1] Features, 1., & Description, 3. (s/f). SNx4HC14 Hex Inverters with Schmitt-Trigger Inputs. Www.ti.com. https://www.ti.com/lit/ds/symlink/sn74hc14.pdf?ts=1709130609427&ref_url=https%253A%252F%252Fwww.google.com%252F



## 3. Desarrollo

### 3.1 Switches, botones y LEDs

El módulo *abc* representa un sistema digital que lee el estado de interruptores y botones para controlar el estado de un conjunto de LEDs, apagando grupos específicos de LEDs según los botones presionados. La lógica es combinacional y la actualización de las salidas se realiza en respuesta a cambios en las entradas. Dado que la FPGA cuenta con 16 switches y 16 leds, cada uno de los leds representa el estado de los switches, y cada uno de los 4 botones se encarga de apagar un grupo de 4 leds. 

#### 1. Encabezado del módulo
```SystemVerilog
module abc(
    input wire [15:0] switches,    
    input wire [3:0]  buttons,     
    output reg [15:0] leds        
);
```
#### 2. Parámetros

El módulo no posee parámetros. 

#### 3. Entradas y salidas

- `switches`: Entradas de los interruptores
- `buttons`: Entrada de botones para seleccionar el grupo de interruptores
- `leds`: Salidas a los LEDs

#### 4. Criterios y restricciones de diseño
Para llevar a cabo la implementación de esta aplicación, se requirió la configuración de los switches, LEDs y botones, los cuales funcionan tanto como entradas como salidas para el módulo. Esta configuración implicó asignar ubicaciones físicas específicas a estos componentes mediante un mapeo que se establece en el archivo de restricciones (constraints). A continuación, se detallan las asignaciones individuales para los switches, botones y LEDs, asegurando así una conexión precisa entre las variables utilizadas por el módulo y los pines físicos correspondientes en la FPGA.

```SystemVerilog
## Switches
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {switches[0]}]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports {switches[1]}]
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports {switches[2]}]
set_property -dict { PACKAGE_PIN W17   IOSTANDARD LVCMOS33 } [get_ports {switches[3]}]
set_property -dict { PACKAGE_PIN W15   IOSTANDARD LVCMOS33 } [get_ports {switches[4]}]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports {switches[5]}]
set_property -dict { PACKAGE_PIN W14   IOSTANDARD LVCMOS33 } [get_ports {switches[6]}]
set_property -dict { PACKAGE_PIN W13   IOSTANDARD LVCMOS33 } [get_ports {switches[7]}]
set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports {switches[8]}]
set_property -dict { PACKAGE_PIN T3    IOSTANDARD LVCMOS33 } [get_ports {switches[9]}]
set_property -dict { PACKAGE_PIN T2    IOSTANDARD LVCMOS33 } [get_ports {switches[10]}]
set_property -dict { PACKAGE_PIN R3    IOSTANDARD LVCMOS33 } [get_ports {switches[11]}]
set_property -dict { PACKAGE_PIN W2    IOSTANDARD LVCMOS33 } [get_ports {switches[12]}]
set_property -dict { PACKAGE_PIN U1    IOSTANDARD LVCMOS33 } [get_ports {switches[13]}]
set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports {switches[14]}]
set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports {switches[15]}]


## LEDs
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports {leds[0]}]
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports {leds[1]}]
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports {leds[2]}]
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports {leds[3]}]
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports {leds[4]}]
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports {leds[5]}]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports {leds[6]}]
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports {leds[7]}]
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports {leds[8]}]
set_property -dict { PACKAGE_PIN V3    IOSTANDARD LVCMOS33 } [get_ports {leds[9]}]
set_property -dict { PACKAGE_PIN W3    IOSTANDARD LVCMOS33 } [get_ports {leds[10]}]
set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports {leds[11]}]
set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports {leds[12]}]
set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports {leds[13]}]
set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports {leds[14]}]
set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports {leds[15]}]

##Buttons
set_property -dict { PACKAGE_PIN W19   IOSTANDARD LVCMOS33 } [get_ports buttons[0]]
set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports buttons[1]]
set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports buttons[2]]
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports buttons[3]]

```

La siguiente imagen muestra de manera gráfica el mapeo entre los botones y los leds, donde al lado izquierdo del bloque se encuentran las entradas y al lado derecho las salidas.

<img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio1/E1.png">


### 3.2 Multiplexor 4 to 1

El módulo *multiplexor* representa un multiplexor de 4 entradas a 1 salida con un ancho de bus configurable. 

#### 1. Encabezado del módulo
```SystemVerilog
module multiplexor #(parameter BUS_WIDTH = 8)
  (input [BUS_WIDTH-1:0] datos_in_0,
   input [BUS_WIDTH-1:0] datos_in_1,
   input [BUS_WIDTH-1:0] datos_in_2,
   input [BUS_WIDTH-1:0] datos_in_3,
   input [1:0] seleccion,
   output reg [BUS_WIDTH-1:0] dato_out
);
```
#### 2. Parámetros

- `BUS_WIDTH`: Parámetro que define el ancho del bus de datos en el multiplexor. Tiene un valor predeterminado de 8, pero en el test bench este toma valores de 4, 8 y 16.


#### 3. Entradas y salidas

- `datos_in_0`, `datos_in_1`, `datos_in_2`, `datos_in_3`: Entradas de datos al multiplexor.
- `seleccion`: Entrada de 2 bits que especifica qué entrada del multiplexor se seleccionará.
- `dato_out`: Salida del módulo, representa el dato seleccionado por el multiplexor según la entrada `seleccion`.


#### 4. Criterios de diseño

Como parte del diseño planteado, se desarrolló un diagrama que ilustrata el sistema junto con sus entradas y salidas. 

La imagen adjunta ilustra a nivel de bloques el sistema:

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio2/E2.png">
</div>

Y la tabla de verdad que determina su comportamiento corresponde a: 

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio2/table.jpg">
</div>


#### 5. Testbench

El siguiente fragmento de código muestra una simplificación del test bench con la finalidad de poder visualizar su esctructura global y funcionamiento.

```SystemVerilog
module tb_multiplexor #(parameter ANCHO = 8) ();

    //Definición de entradas y salidas

    multiplexor #(ANCHO) dut(data_0_i, data_1_i, data_2_i, data_3_i, select, data_o);

    initial begin
        $display("Empezando simulación para un ancho de: %d", ANCHO);
   
        for (int i = 0; i < 50; i=i+1) begin
            data_0_i = $random;
            data_1_i = $random;
            data_2_i = $random;
            data_3_i = $random;

            select = 2'b00; // Se pone la señal de selección en 00
            #5; // Esperar 10 unidades de tiempo        
    
            // Verificar que data_o y data_0_i son iguales 
            if (data_o != data_0_i) begin
                $display("Error en iteración %0d: El valor a la entrada es %b y el obtenido a la salida fue %b, no son iguales", i, data_0_i, data_o);
                $finish;
            end

            // Aqui se encuentran el resto de casos del selector
        end

        $display("Simulación terminada correctamente para un ancho de: %d", ANCHO);
    end
endmodule

// Módulo que envuelve el test bench para cambiar el valor de ANCHO
module tb_wrapper;
    tb_multiplexor #(4) tb_4();
    tb_multiplexor #(8) tb_8();
    tb_multiplexor #(16) tb_16();
endmodule

```


Este test bench es utilizado para verificar el comportamiento del módulo multiplexor con diferentes configuraciones de ancho de bus. En el bloque initial, se inicia una simulación. Se generan datos aleatorios para las entradas del módulo (data_0_i, data_1_i, data_2_i, data_3_i) en un bucle de 50 iteraciones. Para cada iteración, se cambia la señal de selección (select) para probar cada una de las entradas del multiplexor. Se espera un cierto número de unidades de tiempo después de cambiar la selección y se verifica que la salida del módulo (data_o) coincida con la entrada correspondiente y si hay alguna discrepancia, se imprime un mensaje de error y la simulación se detiene. Al final de la simulación, se muestra un mensaje indicando si la simulación terminó correctamente para un determinado ancho de bus (ANCHO).

Luego de la definición del bucle, se crea un módulo *tb_wrapper* que instancia tres test benches con diferentes anchuras de bus (4, 8, y 16). Esto permite ejecutar la simulación para varias configuraciones de anchura del bus del módulo multiplexor en una única simulación.

Luego de correr el test bench, se muestra en la terminal:
```
Empezando simulación para un ancho de:           4
Empezando simulación para un ancho de:           8
Empezando simulación para un ancho de:          16
Simulación terminada correctamente para un ancho de:           4
Simulación terminada correctamente para un ancho de:           8
Simulación terminada correctamente para un ancho de:          16
```


### 3.3 Decodificador para display de 7 segmentos

#### 3.3.1 Decodificador simple (Parte 1) 
La primera parte del decodificador consiste en definir uno o varios módulos que reciban un valor binario representado por 4 bits y devuelva su representación hexadecimal. El decodificador es un circuito combinacional, es decir que las salidas solo dependen de las entradas y no de un estado anterior, una combinación de entrada entregará una salida específica por lo que se pueden igualar o asignar las variables entre sí. Para realizar esa tarea se utiliza la tabla de conversión de binaria 4 bits a hexadecimal. Además recordando que la salida quiere ser representada en un display de 7 segmentos, se investiga el funcionamiento del display de la FPGA a utilizar (Basys 3) y se determina que es de ánodo común por lo que un estado activo no será representado o establecido por un valor de "1" si no que con un "0" y el apagado con un "0" en lugar de un "1", de manera inversa al display que utiliza cátodo común. Con esta información se procede a  crear una tabla que relacione el número valor de entrada con su representación en hexadecimal y los segmentos activos/desactivados del display en la FPGA. Se acalara que el orden en los segmentos es de : 7'b abcdefg.
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

#### 1.  Encabezado del módulo
```SystemVerilog
module logica_deco(
    input [3:0] valor, 
    output reg [0:6] representacion 
    );
```

#### 2.  Entradas y salidas

- `valor`: Entrada de switches (anodos se repiten de 4 en 4)
- `representacion`: Salida a los switches (segmentos repetidos de 4 en 4 en el display)

#### 3.  Criterios de diseño

La implementación se hizo con un bloque always sensible al cambio de la entrada "valor", de manera que en cada cambio, se mapeaba el valor binario de 4 bits y se convierte a su representación hexadecimal con igualdades.

#### 4.  Testbench

Se crea un testbench simple en el que se prueban todos los posibles valores de la señal de entrada (del 0 al 15), y se muestran en la consola por medio de displays para verificar que sean correctos y el algoritmo funcione como se debe.

```SystemVerilog
module logica_deco_tb;

    // Definición de señales
    reg [3:0] valor;                   // Entrada
    wire [0:6] representacion;        // Salida
    
    // Instancia del módulo bajo prueba
    logica_deco DUT (
        .valor(valor),               // Conexión de la señal de entrada
        .representacion(representacion) // Conexión de la señal de salida
    );
    // Generación de estímulos
    initial begin
        // Inicializar valores
        valor = 4'b0000; // Ejemplo de entrada inicial
        #10; // Espera 10 unidades de tiempo
    
        // Cambiar la entrada y observar la salida
        valor = 4'b0001; // Cambiar la entrada a 1
        #10;             // Esperar un ciclo de reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        valor = 4'b0010; // Cambiar la entrada a 2
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);

   [...]

        valor = 4'b1111; // Cambiar la entrada a 15
        #10;             // Esperar un ciclo del reloj
        $display("Decimal: %d, Binario: %b, Hexadecimal (Ánodo Común): %h (AC), Segmentos (Binario): %b", valor, valor, valor, representacion);
        
        // Terminar la simulación
        $finish;
    end

endmodule
```

La simulación se puede ver en la imagen siguiente: 

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio3/Imagenes/TB%201%20Se%C3%B1ales.png">
</div>

Y los valores de la consola, correctos en cada prueba se miran a continuación:

```
Decimal:  1, Binario: 0001, Hexadecimal (Ánodo Común): 1 (AC), Segmentos (Binario): 1001111
Decimal:  2, Binario: 0010, Hexadecimal (Ánodo Común): 2 (AC), Segmentos (Binario): 0010010
Decimal:  3, Binario: 0011, Hexadecimal (Ánodo Común): 3 (AC), Segmentos (Binario): 0000110
Decimal:  4, Binario: 0100, Hexadecimal (Ánodo Común): 4 (AC), Segmentos (Binario): 1001100
Decimal:  5, Binario: 0101, Hexadecimal (Ánodo Común): 5 (AC), Segmentos (Binario): 0100100
Decimal:  6, Binario: 0110, Hexadecimal (Ánodo Común): 6 (AC), Segmentos (Binario): 0100000
Decimal:  7, Binario: 0111, Hexadecimal (Ánodo Común): 7 (AC), Segmentos (Binario): 0001111
Decimal:  8, Binario: 1000, Hexadecimal (Ánodo Común): 8 (AC), Segmentos (Binario): 0000000
Decimal:  9, Binario: 1001, Hexadecimal (Ánodo Común): 9 (AC), Segmentos (Binario): 0000100
Decimal: 10, Binario: 1010, Hexadecimal (Ánodo Común): a (AC), Segmentos (Binario): 0001000
Decimal: 11, Binario: 1011, Hexadecimal (Ánodo Común): b (AC), Segmentos (Binario): 1100000
Decimal: 12, Binario: 1100, Hexadecimal (Ánodo Común): c (AC), Segmentos (Binario): 0110001
Decimal: 13, Binario: 1101, Hexadecimal (Ánodo Común): d (AC), Segmentos (Binario): 1000010
Decimal: 14, Binario: 1110, Hexadecimal (Ánodo Común): e (AC), Segmentos (Binario): 0110000
Decimal: 15, Binario: 1111, Hexadecimal (Ánodo Común): f (AC), Segmentos (Binario): 0111000
```
#### 3.3.2 Decodificador seleccionable (Parte 2) 

La segunda parte del ejercicio del decodificador consiste en modificar el primer diseño de manera que los 16 switches totales se separen en grupos de 4 switches y con los botones se decida como moverse entre los displays. Para solucionar esta parte se piensa en 2 maneras distintas, la primera utiliza 4 botones, 1 asignado a un display distinto de manera que cuando se presione solamente se obtengan datos de sus switches específicos y la segunda solución es utilizar 2 botones que hagan que los display cambian hacia un lado o hacia el otro. Para ambos diseños se agrega un multiplexor 4 a 1 para poder multiplexar los switches de cada caso y para implementar el resto se piensa agregar lógica de compuertas OR en la primera opción de 4 botones, uno con cada display y para la segunda opción otro multiplexor para encender el ánodo específico que es movido por un contador interno que se mueve de 0 a 3. 

Antes de empezar con el desarrollo del ejercicio se crea un diagrama de bloques para representar el orden del circuito combinacional, para ello se identifican las entradas y salidas, ademas de la lógica para llegar al resultado. 

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio3/Imagenes/Diagrama%20de%20bloques%20parte%202.png">
</div>

#### Tabla de conversión múltiple:

La siguiente tabla muestra la tabla de verdad del selector para el multiplexor.

<div align="center">
  
| btn[3]    | btn[2] | btn[1]    |s[0] | s[1]|
| --------- | ---- | --------  |----- |----- |
| 0      | 0        | 0       |X      |X |
| 0      | 0        | 1       |      0|  1   |
| 0      | 1        | 0      |      1 |  0 |
| 1      | 0        | 0     |      1 |   1|


</div>

#### 1.  Encabezado del módulo

```SystemVerilog
module logica_deco2(
    input [3:0] btn,
    input [15:0] sw, 
    output reg [0:6] seg, 
    output [3:0] an, 
    output dp
    );
```
#### 2.  Entradas y salidas

- `btn`: Entrada de la señal de los botones escogidos
- `sw`: Entrada de los switches
- `seg`: Salida de la señal de los segmentos activos en display (Ánodo Común)
- `an`: Salida de activación de ánodos (Ánodo Común)

#### 3.  Criterios y restricciones de diseño

Se utiliza la misma implementación de conversión de la parte 1 pero se agrega un multiplexor para poder escoger los segmentos divididos de 4 en 4, esos segmentos están relacionados a un botón específico que activa un display propio en el que va a mostrar el mapeo de los switches en hexadecimal. Los botones utilizan compuertas OR para poder activarse. Para poder activar los botones y switches se activan partes las señales del "constraint" que corresponden a:

```SystemVerilog
# Switches
set_property PACKAGE_PIN V17 [get_ports {sw[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {sw[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {sw[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property PACKAGE_PIN V15 [get_ports {sw[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property PACKAGE_PIN W14 [get_ports {sw[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property PACKAGE_PIN W13 [get_ports {sw[7]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
set_property PACKAGE_PIN V2 [get_ports {sw[8]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
set_property PACKAGE_PIN T3 [get_ports {sw[9]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
set_property PACKAGE_PIN T2 [get_ports {sw[10]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
set_property PACKAGE_PIN R3 [get_ports {sw[11]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
set_property PACKAGE_PIN W2 [get_ports {sw[12]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
set_property PACKAGE_PIN U1 [get_ports {sw[13]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
set_property PACKAGE_PIN T1 [get_ports {sw[14]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
set_property PACKAGE_PIN R2 [get_ports {sw[15]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]
 
#7 segment display
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]

#Decimal Point
set_property PACKAGE_PIN V7 [get_ports dp]							
	set_property IOSTANDARD LVCMOS33 [get_ports dp]

#Anodes
set_property PACKAGE_PIN U2 [get_ports {an[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


#Buttons
set_property PACKAGE_PIN W19 [get_ports btn[2]]						
	set_property IOSTANDARD LVCMOS33 [get_ports btn[2]]

set_property PACKAGE_PIN U17 [get_ports btn[1]]						
	set_property IOSTANDARD LVCMOS33 [get_ports btn[1]]

set_property PACKAGE_PIN T18 [get_ports btn[3]]						
	set_property IOSTANDARD LVCMOS33 [get_ports btn[3]]

set_property PACKAGE_PIN T17 [get_ports btn[0]]						
	set_property IOSTANDARD LVCMOS33 [get_ports btn[0]]
```

Además, se aclara que si se apretan dos o más botones a la vez, los displays respectivos se activan pero solo recibiran la señal de uno de los 4 grupos de switches relacionados, por lo general será el defautl de 0 a 3. Se puede crear otro multiplexor para restringir este comportamiento pero por requisitos de diseño no es necesario, sería una funcionalidad extra, también se podría implementar algún tipo de debouncer o una lógica para bloquear los botones cuando se está presionando uno. 


#### 4.  Testbench

Se crea un testbench detallado para cada uno de los 15 valores en los 4 botones distintos, los resultados son esperados y correctos en cada señal.

```SystemVerilog
module logica_deco2_tb;

    // Definición de parámetros
    reg [3:0] btn;
    reg [15:0] sw;
    wire [0:6] seg;
    wire [3:0] an;
    wire dp;
    
    // Instancia del módulo bajo prueba
    logica_deco2 dut (
        .btn(btn),
        .sw(sw),
        .seg(seg),
        .an(an),
        .dp(dp)
    );
    
    // Estímulo de entrada
    initial begin
        // Inicializar entradas
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12]= 4'b0000;
        sw[11:8]= 4'b0000;
        sw[7:4]= 4'b0000;  
        sw[3:0]= 4'b0000;  
        
        // Esperar un poco antes de empezar
        #10;
        
        // Cambiar las entradas para simular diferentes condiciones
        // Presionar botón 0 
        //Mapeo 0
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0000;
        #5;
        //Mapeo 1
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0001;
        #5;       
        //Mapeo 2
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0010;
        #5;       
        //Mapeo 3
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 1;
        sw[3:0] = 4'b0011;
[...]

        // Presionar botón 1 
        //Mapeo 0
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0000;
        #5;
        //Mapeo 1
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0001;
        #5;       
        //Mapeo 2
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0010;
        #5;       
        //Mapeo 3
        btn[3]= 0;
        btn[2]= 0;
        btn[1]= 1;
        btn[0]= 0;
        sw[7:4] = 4'b0011;
        
        
[...]
        // Presionar botón 3 
        //Mapeo 0
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0000;
        #5;
        //Mapeo 1
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0001;
        #5;      
        //Mapeo 2
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0010;
        #5;       
        //Mapeo 3
        btn[3]= 1;
        btn[2]= 0;
        btn[1]= 0;
        btn[0]= 0;
        sw[15:12] = 4'b0011;

[...]
        
        // Terminar simulación
        $finish;
    end
    
    // Visualización de las salidas
    always @(*) begin
        $display("Botón Pulsado = %b , Display Activo = %b, Valor en Switches = %b, Valor en display= %b (AC)", btn, an, sw, seg);
    end

endmodule
```

Las señales de la simulación se pueden ver en las siguientes imágenes:

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio3/Imagenes/TB%202.1.png">
</div>

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio3/Imagenes/TB%202.2.png">
</div>

Los resultados en la consola son los siguientes:

```
Botón 0 
Botón Pulsado = 0000 , Display Activo = 1111, Valor en Switches = 0000000000000000, Valor en display= 0000001 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000000001, Valor en display= 1001111 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000000011, Valor en display= 0010010 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000000011, Valor en display= 0000110 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000000100, Valor en display= 1001100 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000000101, Valor en display= 0100100 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000000111, Valor en display= 0100000 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000001000, Valor en display= 0001111 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000001001, Valor en display= 0000000 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000001001, Valor en display= 0000100 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000001010, Valor en display= 0001000 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000001011, Valor en display= 1100000 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000001100, Valor en display= 0110001 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000001101, Valor en display= 1000010 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000001110, Valor en display= 0110000 (AC)
Botón Pulsado = 0001 , Display Activo = 1110, Valor en Switches = 0000000000001111, Valor en display= 0111000 (AC)

Botón 1
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000000010000, Valor en display= 0000001 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000000100000, Valor en display= 1001111 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000000110000, Valor en display= 0010010 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000001000000, Valor en display= 0000110 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000001010000, Valor en display= 1001100 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000001100000, Valor en display= 0100000 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000001110000, Valor en display= 0001111 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000010000000, Valor en display= 0000000 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000010100000, Valor en display= 0000100 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000010110000, Valor en display= 0001000 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000010110000, Valor en display= 1100000 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000011000000, Valor en display= 0110001 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000011010000, Valor en display= 1000010 (AC)
Botón Pulsado = 0010 , Display Activo = 1101, Valor en Switches = 0000000011100000, Valor en display= 0110000 (AC)
Botón Pulsado = 0100 , Display Activo = 1101, Valor en Switches = 0000000000000000, Valor en display= 0111000 (AC)

Botón 2
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000000100000000, Valor en display= 0000001 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000000100000000, Valor en display= 1001111 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000001000000000, Valor en display= 0010010 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000001100000000, Valor en display= 0000110 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000010000000000, Valor en display= 1001100 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000011000000000, Valor en display= 0100100 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000011100000000, Valor en display= 0100000 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000100000000000, Valor en display= 0001111 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000100100000000, Valor en display= 0000000 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000101000000000, Valor en display= 0000100 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000101100000000, Valor en display= 0001000 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000110000000000, Valor en display= 1100000 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000110100000000, Valor en display= 0110001 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000111000000000, Valor en display= 1000010 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000111100000000, Valor en display= 0110000 (AC)
Botón Pulsado = 0100 , Display Activo = 1011, Valor en Switches = 0000111100000000, Valor en display= 0111000 (AC)

Botón 3
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 0000000000000000, Valor en display= 0000001 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 0001000000000000, Valor en display= 1001111 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 0010000000000000, Valor en display= 0010010 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 0011000000000000, Valor en display= 0000110 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 0101000000000000, Valor en display= 1001100 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 0110000000000000, Valor en display= 0100100 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 0111000000000000, Valor en display= 0100000 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 0111000000000000, Valor en display= 0001111 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 1000000000000000, Valor en display= 0000000 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 1010000000000000, Valor en display= 0000100 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 1011000000000000, Valor en display= 0001000 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 1100000000000000, Valor en display= 1100000 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 1101000000000000, Valor en display= 0110001 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 1110000000000000, Valor en display= 1000010 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 1111000000000000, Valor en display= 0110000 (AC)
Botón Pulsado = 1000 , Display Activo = 0111, Valor en Switches = 1111000000000000, Valor en display= 0111000 (AC)
```

### 3.4 Sumador y Ruta crítica

El módulo *rca* genera una estructura de múltiples sumadores completos en cascada, de manera que, da los resultados de la adición de una secuencia binaria de n bits. El RCA incluye sumadores completos, por lo que el acarreo se generará en cada etapa del sumador según bit.

#### 1. Encabezado del módulo
```SystemVerilog
module rca #( 
    parameter WORD_SIZE = 64
)(
    input [WORD_SIZE-1:0] A,
    input [WORD_SIZE-1:0] B, 
    input Cin,
    input clk,

    output [WORD_SIZE:0] S, 
    output Cout
);
```
#### 2. Parámetros
```
parameter WORD_SIZE //Establece la cantidad de bits para el tamaño de palabra. 8, 16, 32, 64...
```

#### 3. Entradas y salidas
```SystemVerilog
    input [WORD_SIZE-1:0] A, //Recibe la entrada A de tamaño WORD_SIZE-1:0
    input [WORD_SIZE-1:0] B, //Recibe la entrada B de tamaño WORD_SIZE-1:0
    input Cin, //Recibe el carry de entrada, por definición es de un 1 bit.
    input clk, //Reloj para obtener reporte de tiempos de propagación, slack y más.

    output [WORD_SIZE:0] S, //Salida del resultado de suma, es de tamaño WORD_SIZE:0 para considerar el overflow.
    output Cout //Es el valor del carry de salida, por definición es de un 1 bit.
```

#### 4. Criterios de diseño

Para diseñar el Ripple Carry Adder fue necesario diseñar un módulo de sumador completo (FA) el cual sería instanciado dentro del RCA. Por tanto, para el diseño del full adder, se consideró la tabla de verdad que modela su comportamiento de salida S en función de las entradas A y B.

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio4/images/FA_truth_table.png" alt="Tabla de verdad para sumador completo en el bit 0">
	
Tabla de verdad para sumador completo en el bit 0.

</div>

Con base en lo anterior, el sumador completo se describe tal que:

```SystemVerilog
module FullAdder(
    input a, b, cin, // Entradas de un 1 bit del sumador completo
    output s, cout // Salida de un 1 bit de la suma y acarreo
);
// Definición de la suma y el acarreo mediante compuertas lógicas
assign s = a ^ b ^ cin;
assign cout = (a & b) | (a & cin) | (b & cin);

endmodule
```

De tal manera que, la instancia del módulo *FullAdder* dentro del módulo *rca*, se observa como:
```SystemVerilog

wire [WORD_SIZE:0] local_Cout; // Salida local para los carrys intermedios
generate
    for (i = 0; i < WORD_SIZE; i = i + 1) begin : bit_
        FullAdder FA_ (
            .a(A[i]), // La entrada a del FA conectada con la entrada A del RCA
            .b(B[i]), // La entrada b del FA conectada con la entrada B del RCA
            .cin(local_Cout[i]), // Conexión de los carrys intermedios a ser carrys de entradas, de tamaño WORD_SIZE:0 por el overflow
            .s(S[i]), // La salida s del FA conectada con la salida S del RCA
            .cout(local_Cout[i+1]) // cout será el cin del siguiente sumador
        ); 
    end
endgenerate

assign S[WORD_SIZE] = local_Cout[WORD_SIZE]; //El bit overflow es el bit de acarreo (portado por local_cout) del último sumador
```

#### 5. Testbench

En relación con el testbench del módulo *rca*, la primera prueba que se le realizó fue el testeo de la capacidad de generar resultados correctos para todas las posibles combinaciones (incluidas aquellas que generan overflow) para una palabra de 8 bits. En consencuencia, los resultados obtenidos fueron los siguientes:


<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio4/images/testbench rca 8bit combi.png" alt="Todas las combinaciones de sumas para palabra de 8 bits. Puntero posicionado en caso overflow.">
	
Combinaciones de suma para palabra de 8 bits. Puntero posicionado en caso overflow.
	
</div>

Posteriormente, la segunda prueba consistió en parametrizar el RCA a 64 bits y modificar sus constraints para obtener una frecuencia de reloj de 10MHz y otra de 100MHz. Lo anterior permite verificar si el sumador es capaz de generar resultados correctos debido al segmento de autoverificación descrito en el módulo de test_bench.

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio4/images/error rca 10mhz.png" alt="Tiempo en el que se generó un error con 10MHz.">
	
Tiempo en el que se generó un error con 10MHz.
	
</div>

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio4/images/rca 100mhz.png" alt="Tiempo en el que se generó un error con 100MHz.">
	
Tiempo en el que se generó un error con 100MHz.
	
</div>

Se observa que, el RCA no fue capaz de generar resultados correctos con ninguna de las dos frecuencias. Implicando que, la frecuencia de operación para el RCA desarrollado se encuentra menor a los 10MHz, ya que no puede encontrarse superior a los 100MHz porque, si bien le sobra tiempo de operación (Slack positivo), se detectó más pronto un error que cuando se detectó utilizando la frecuencia de 10MHz. Quiere decir lo anterior que, con 100MHz, el RCA genera más pronto error ya que no permite la propagación adecuada de la señal entre sus ciclos de reloj.

Finalmente, se implementó un CLA de 8 bits y se comparó su tiempo de retardo con un RCA de también 8 bits:

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio4/images/delay rca8bits 100mhz.png" alt="Tiempo en el que se generó un error con 10MHz.">
	
Tiempo delay para RCA de 8 bits.
	
</div>



<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio4/images/delay cla8bits 100mhz.png" alt="Tiempo en el que se generó un error con 100MHz.">
	
Tiempo delay para CLA de 8 bits.
	
</div>

Como conclusión, al contar con menos tiempo de delay, el CLA realiza tiene menor tiempo de retardo en la propagación de la señal que un RCA.



### 3.5 Unidad aritmética lógica (ALU)
El modulo ALU realiza operaciones aritméticas y logicas con operandos `A` y `B` parametrizados.
La entrada `alucont` toma un operador aritmetico o lgico para los cuales, cada oprador tiene un código binario asignado, de esta forma se indica a la ALU el tipo de operación que realice.
La ALU tiene una entrada `flagin` la cual corresponde al carry de entrada el cual indica a las operaciones suma y resta el si hay acarreo de entrada y tambien de acuerdo al valor binario 0 o 1 indica a la operación `NOT` cual operando negar y a las operaciones de `Incremento` y `Decremento` a cual operando deben aplicar dicha operación.
El resultado de la operación es dado mediente salida `aluresult`, mientras que la salida `flagout` contiene los bits de acarreo.
 
#### 1. Encabezado del módulo
```SystemVerilog
module module_ALU #(parameter N = 4)// se crea una parametrizacion del modulo ALU
(
    
    input logic [N-1:0]    A_i, //Entada del operando A 
    input logic [N-1:0]    B_i, //Entrada del operando B 
    
    input logic [3:0]      alucont_i, //Entrada de control 
    input logic            flagin_i,// Entrada del carry de entrada
    
    output logic [N-1:0]   aluresult_o,// Salida del resultado
    output logic           flagout_o,// Salida del carry de salida
    output logic           flagz_o// Salida de la bandera z
  
);
```
#### 2. Parámetros

`N`: Tamaño de las entradas y salida de resultado

#### 3. Entradas y salidas

- `A_i`: Entada del operando A
- `B_i`: Entrada del operando B 
- `alucont_i`: Entrada de control 
- `flagin_i`: Entrada del carry de entrada.
- `aluresult_o`: Salida del resultado
- ` flagout_o`: Salida del carry de salida
- `flagz_o`: Salida de la bandera z


#### 4. Criterios de diseño

Para el funcionamiento de la ALU se utiliza un bloque `always_comb` el cual mediante la función `case` se puede cambiar entre las distintas operaciones y seleccionar la operación indicada por la entrada `alucont`, de esta forma la ALU sabe cual operación realizar.
De acuerdo al diagrama de bloques del diseño, se tienen las entradas `A_i` y `B_i` las cuales corresponden a los operandos que se ingresan a la ALU y la entrada `alucont_i` me diante la cual se indica la operación y la entrada `flagin_i` la cual corresponde al acarreo de salida e indica a las operaciones de  `NOT`, `Incremento` y `Decremento` cual de los operandos aplicar una de estas operaciones según se haya indicado por la entrada `alucont_i`.

<div align="center">
<img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio5/Imagenes/DiagramaBloque.png" alt="Diagrama de bloques ALU" width="500" >
</div>

Dentro del bloque `always_comb` se una un `default` para los codigos binarios que no se consideran en esta ALU.

Al final del bloque  `always_comb` se describe la logica mediante  `if` y  `else` para la salida `flagz`.

#### 5. Testbench

Se hace un testbench para simular las distintas operaciones de la ALU.
EL testbench que se realiza utiliza un valor aleatorio para los operandos `A_i` y `B_i` y para la entrada `flagin`, para el caso de la entrada `alucont` se especifica el código binario respectavo de cada operación para de esta forma simular todas la operaciones.

```SystemVerilog
module tb_module_ALU #(parameter N = 4);

    logic [N-1:0]    A; //Entada A de la Alu
    logic [N-1:0]    B; //Entrada B de la ALU
    
    logic [3:0]      alucont; //entrada de control de la ALU
    logic            flagin;// entrada de la flag de entrada
    
    logic [N-1:0]   aluresult;// salida de la ALU
    logic           flagout;// salida de la flag
    logic           flagz;// salida de la bandera z
    
   
    
    module_ALU dut (
    
    .A_i (A),
    .B_i (B),
    .alucont_i(alucont),
    .flagin_i(flagin),
    .aluresult_o(aluresult),
    .flagz_o(flagz),
    .flagout_o(flagout)
    
    );
    
    
    
    initial begin
         
         
         A= 4'b0000; //A= 0h
         B= 4'b0000; //b= 0h
         flagin = 4'b0000;
   
//         #10
   
         //test numero 1
         alucont = 4'b0000; // 0h Operacion AND
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
         //flagin = $urandom_range(4'b0000, 4'b0001);
    
         #10

          //test numero 2
         alucont = 4'b0001; //1h Operacion OR
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
        // flagin = $urandom_range(4'b0000, 4'b0001);
    
         #10  
    
         //test numero 3
         alucont = 4'b0010; //2h Suma
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
         flagin = $urandom_range(4'b0000, 4'b0001);
         #10   

          //test numero 4
         alucont = 4'b0011; //3h Incrementar
         #10

         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
         flagin = $urandom_range(4'b0000, 4'b0001);
         #10     

    
         //test numero 5
         alucont = 4'b0100; //4h Operacion decrementar
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
         flagin = $urandom_range(4'b0000, 4'b0001);
         #10    

      
         //test numero 6
         alucont = 4'b0101; //5h NOT 
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
         flagin = $urandom_range(4'b0000, 4'b0001);
         #10   
   
    
         //test numero 7
         alucont = 4'b0110; //6h Resta
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
         flagin = $urandom_range(4'b0000, 4'b0001);
         #10 
            
         //test numero 8
         alucont = 4'b0111; //7h XOR
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
    
         #10 
       
         //test numero 9
         alucont = 4'b1000; //8h Corrimiento hacia la izquierda
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);
    
         #10 
     
         //test numero 10
         alucont = 4'b1001; //9h Corrimiento a la derecha
         #10
    
         A = $urandom_range(4'b0000, 4'b1111);
         B = $urandom_range(4'b0000, 4'b1111);    
         
         #10
           
         $finish;
    
      end 
 
endmodule
```
En la siguiente imagen se muestra los resultados de la simulación obtenida.

<div align="center">
<img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio5/Imagenes/TestBench.png" alt="Diagrama de bloques ALU" width="1000" >
</div>


Como observación importante durante la demostración del funcionamiento de la ALU, queda pendiente hacer un testbench de auto-chequeo, esto para probar los diferentes casos de las operaciones.
