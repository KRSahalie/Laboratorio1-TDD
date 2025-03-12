# Ejercicio 1: Switches, botones y LEDs
## Planteamiento del  ejercicio

Durante la construcción de la lógica de este ejercicio se partió del hecho de que este puede verse como dos tareas o bloques individuales. El primer bloque consiste en asignar los leds a cada uno de los switches para así obtener la combinación de leds apagados y encendidos que reflejen el estado de apagado/encendido de los switches. Luego de obtener este funcionamiento se realiza la asiganción de los leds a cada botón de la FPGA con la finalidad de apagar el grupo de leds siempre y cuando el switch que los gobierna se encuentre presionado.
Como parte del planteamiento de esta segunda parte, se definió también cuáles leds corresponden a cada botón. Para este caso la asignación de los leds se realiza del más al menos significativo, siguiendo el orden de los botones: U17, T17, T18, W19. 



## Diagrama de bloques

La imagen adjunta ilustra a nivel de bloques el sistema junto con sus entradas y salidas. 

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio1/E1.png" width="500">
</div>



