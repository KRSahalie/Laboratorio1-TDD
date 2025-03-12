# Ejercicio 4:Sumador y ruta crítica

## Planteamiento del  ejercicio

## 1) Diseño de un RCA de tamaño de palabra parametrizable:
Para ello se procederá a diseñar un módulo de full adder que tome como entradas de un bit a y b, así como el carry-in, y produzca las salidas de suma y carry-out.
Utilizando este módulo de full adder, se construirá un módulo RCA parametrizable con un tamaño de palabra predeterminado de 8 bits. Se instanciará el módulo del full adder según sea necesario para cumplir con el tamaño de palabra deseado.

## 2) Testbench para el RCA:
Se creará un testbench para el RCA diseñado en el paso anterior.
El testbench será configurado para evaluar el funcionamiento del RCA en todos los posibles casos de datos de entrada, incluyendo casos de overflow, mediante las 2^8 combinaciones.

## 3)Corrección de errores y advertencias:
Se revisarán y corregirán todos los errores y advertencias producidas por la simulación.

## 4) RCA de 64 bits y prueba de rendimiento:
Se implementará un RCA con una palabra de 64 bits, estableciendo una frecuencia de reloj objetivo de 10 MHz como parte de las constraints. Luego, se realizará un testbench en el que los datos de entrada cambien a una frecuencia de 100 M-samples/s para evaluar la capacidad del sumador para producir resultados correctos.

## 5) Implementación y comparación con un CarryLookahead Adder (CLA):
Se diseñará un módulo específico para un CarryLookahead Adder (CLA) de 8 bits. Posteriormente, se ejecutará un testbench utilizando la instancia del móduclo del CLA y se compararán sus resultados con los obtenidos para el RCA de 8 bits.
