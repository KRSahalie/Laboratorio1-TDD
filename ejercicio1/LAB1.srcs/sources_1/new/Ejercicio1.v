`timescale 1ns / 1ps

module abc(
    input wire [15:0] switches,    // Entradas de los interruptores
    input wire [3:0]  buttons,     // Botones para seleccionar el grupo de interruptores
    output reg [15:0] leds         // Salidas a los LEDs
);

    always @(*) begin
        // Actualizar LEDs siempre que haya un cambio en los interruptores
        leds = switches;

        // Apagar grupos de LEDs según los botones presionados
        if (buttons[0]) leds[3:0]  = 4'b0000;
        if (buttons[1]) leds[7:4]  = 4'b0000;
        if (buttons[2]) leds[11:8] = 4'b0000;
        if (buttons[3]) leds[15:12] = 4'b0000;
    end

endmodule

