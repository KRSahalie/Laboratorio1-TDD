# Unidad aritmético-lógica (ALU)

## Planeamiento 
Para el diseño de la ALU se diseña un diagrama de bloques que representa el funcionamiento de esta como se muestra en la siguiente figura:

<div align="center">
  <img src="https://github.com/EL3313/laboratorio1-grupo-6/blob/main/ejercicio5/Imagenes/DiagramaBloque.png" alt="Diagrama de bloques ALU">
</div>

Se definieron las entradas y salidas según su comportamiento.
### Entradas
- a_i: Operando 
- b_i: Operando
- alucont_i: Operador
- flagin_i: Acerreo de entrada
### Salidas
- flags_o: Bandera de resultado Cero (Z) y salida C
- aluresult_o: Resultado de la operación aritmetica o lógica
### Descripción de las entradas
- a_i y b_i.
  Corresponden a los operandos los cuales la ALU toma y realiza una operación.
  
- alucont_i.
  Corresponde a la unidad encargada de controlar la operación que la ALU va a realizar.
  Esta entrada toma un código el cual corresponde a una operación aritmética o lógica, de esta forma se encarga de indicar la operación aritmética o lógica que la ALU va a     realizar.
  
- flagin_i: Esta entrada corresponde al acarreo de entrada, para las operaciones de suma o resta o el bit de entrada en los corrimientos hacia la izquierda o derecha o en las operaciones de negación, incremento y decremento, esta bandera selecciona cuál de los operandos utilizar (0 debe seleccionar al operando A y 1 al operando B).

### Salidas
- flags_o: La bandera de salida C se encarga de indicar cual fue el “último” bit que salió de la ventana representada.
La bandera de resultado Cero (Z) es uno si el resultado es cero independientemente de la operaci´on l´ogica o aritm´etica seleccionada.

- aluresult_o: Esta salida da el resultado obtenido de la operación que se realizó.

De acuerdo al codigo que se indiuqe en la entrada alucont_i será la función que realice la ALU.

Las operaciones que realiza la ALU según su código en hexadecimal son:

- 0h: and
- 1h: or
- 2h: suma (en complemento a dos)
- 3h: incrementar en uno el operando
- 4h: decrementar en uno el operando
- 5h: not (sobre un operando)
- 6h: resta (en complemento a dos)
- 7h: xor
- 8h: corrimiento a la izquierda del operando A
-9h: corrimiento a la derecha del operando A
