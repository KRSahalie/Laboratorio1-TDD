# Bitácora

## 🟢 Nota:

> Espacio para redactar sobre avances, por favor agregar fecha y usuario del colaborador.

## Miércoles 21 de febrero de 2024
**@KRSahalie, @pviquez99, @kdsalazar95, @Chacjean**
- [x] El grupo se organiza y decide la distribución de los ejercicios.
  - pviquez99: Ejercicio 1 y 2.
  - KRSahalie: Ejercicio 3.
  - Chacjean: Ejercicio 4.
  - kdsalazar95: Ejercicio 5.
     

## Viernes 23 de febrero de 2024
**@pviquez99**
- [x] Definición de las entradas y salidas de módulo para el ejercicio 1.
- [X] Lógica de los botones (con los grupos de switches y leds).
- [X] Queda pendiente trabajar en el archivo de constraints.
- [X] Falta hacer el link entre los pines de la FPGA y las variables usadas en el código (investigar cómo se conectan).


**@KRSahalie**
- [x] Completar las 4 primeras preguntas del Cuestionario Previo.
- [x] Comenzar a crear el planteamiento para el Ejercicio 3.

**@Chacjean**
- [x] Fijar las configuraciones requeridas para el correcto funcionamiento del software. A partir de lo anterior, identificar potencial de error en ruta de archivos debido a un espacio.
- [x] Asistir al taller de Verilog para Xilinx para mejor entendimiento de la herramienta.
- [x] Reestablecer de fábrica el equipo para resolver el potencial error respecto a ruta de archivos.


## Sábado 24 de febrero de 2024
**@pviquez99**
- [X] Se completa el archivo de constraints del ejercicio 1.
- [X] Se programa la FPGA y el funcionamiento es correcto.
- [X] Algunos de los problemas obtenidos:
  - Al realizar la asignación de valores a los leds, se estaba utilizando "<=" lo cual provocaba que no fuera una respuesta instantánea al presionar los botones, al reemplazarlo por "=" la actualización se realizaba de manera correcta.
- [X] Se completa el módulo del ejercicio 2 y se inicia el testbench.

**@Chacjean**
- [x] Instalar nuevamente Vivado.
- [X] Responder la pregunta 5 y 6 del cuestionario previo.

## Domingo 25 de febrero de 2024
**@KRSahalie**
- [X] Se termine el planteamiento del ejercicio 3.
- [X] Se completa el ejercicio 3.
- [X] Se prueba en la FPGA con resultados positivos.

**@pviquez99**
- [X] Se completa el testbench del ejercicio 2.
      
**@kdsalazar95**
- [X] Se investiga sobre el comportamiento de la ALU y busca ejemplos de su código en System Verilog para comprender mejor su diseño e implementación.

## Lunes 26 de febrero de 2024
**@KRSahalie**
- [X] Se pasa a Markdown el planteamiento del ejercicio 3 de manera parcial.

**@kdsalazar95**
- [X] Se continua con la investigación de la ALU
- [X] Se inicia con el diseño para el diagrama de bloques de la ALU

## Martes 27 de febrero de 2024
**@kdsalazar95**
- [X] Se pasa a digital el diagrama de bloques de la ALU.
- [X] Se termina la descripción del planeamiento.
- [X] Se definen las entradas y salidas del módulo.
  
**@Chacjean**
- [x] Ressponder la pregunta 7, 8 y 9 del cuestionario previo.
- [X] Subir el planteamiento para la resolución del ejercicio 4.

## Miercoles 28 de febrero de 2024
**@kdsalazar95**
- [X] Se inicia con el bloque de intrucciones.
- [X] En el bloque de instrucciones se describen las opraciones lógicas. 
- [X] Se investiga como hacer la suma y resta en complemento a 2 para describirlo en el bloque de instrucciones.
- [X] Se describe el planeamiento en github y se hacen unos cambios al diagrama de bloques.

**@KRSahalie**
- [X] Se completa el Markdown del planteamiento.

**@Chacjean**
- [X] Se realiza el módulo del RCA y su testbench.

## Jueves 29 de febrero de 2024
**@kdsalazar95**
- [X] Se termina el modulo.

**@pviquez99**
- [X] Se agrega la funcionalidad de que se apaguen varios grupos de leds al presionar varios botones.

## Viernes 01 de marzo de 2024
**@kdsalazar95**
- [X] Se hace el Testbench:
    - Se hacen direfentes test para probar las operaciones de la ALU.
- [X] Se prueba la simulación.
- [X] Aparece un error en la simulación:
      - No se estan iniciando algunas operaciones
- [X] Se corriege el error en la simulación que era ocasionado por un retraso en el tiempo.
- [X] Se graga la estructura para la documentación en el README  principal.


## Sábado 02 de marzo de 2024
**@Chacjean**
- [X] Se realiza el módulo del CLA y su testbench.

## Domingo 03 de marzo de 2024
**@pviquez99**
- [X] Se modifica el test bench del ejercicio 2 para que realice autoverificación y pueda probar anchos de datos de 4, 8 y 16 bits.

## Lunes 04 de marzo de 2024
**@pviquez99**
- [X] Se documentan ambos ejercicios y quedan listos.

**@Chacjean**
- [X] Se realiza el punto 3.4.4 y 3.4.5, correspondiente al cambio de frecuencias en RCA y comparación con CLA, respectivamente.
- [X] Las comparaciones y análisis fueron realizados con los datos de behavioral simulation.

## Miércoles 6 de marzo de 2024
**@KRSahalie**
- [x] Se termina la documentación del ejercicio 3.

**@Chacjean**
- [x] Se presenta el funcionamiento del ejercicio 4, sin embargo, al no haber sido probado con los datos post-synthesis timing simulation, estos eran imprecisos y no representaban el funcionamiento esperado.
- [X] Posterior a la clase, se presenta nuevamente el ejercicio 4 corregido y en buen funcionamiento al profesor. 

## Viernes 08 de marzo de 2024
**@KRSahalie**
- [X] Se revisa la documentación del ejercicio 3 y se terminan de subir sources al repositorio.

**@Chacjean**
- [X] Se sube la documentación correspondiente al ejercicio 4 del laboratorio 1.
