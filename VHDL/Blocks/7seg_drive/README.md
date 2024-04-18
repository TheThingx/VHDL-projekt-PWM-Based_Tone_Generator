# 7seg_2digit

Celkový modul pro zobrazení noty(tónu) a oktávy na dva různé displeje je rozdělen na dvě části.
![schematic](https://github.com/TheThingx/VHDL-projekt-PWM-Based_Tone_Generator/assets/56256388/4ba61591-c801-479b-9980-7d7fd30eee4c)


1. Divider je modul, který na vstup note přijímá binární hodnoty z přepínačů SW(4:0). Výstupem jsou dva signály:
seg_out_1(6:0) - signál pro zobrazení noty(tónu) na jeden displej (C, D, E, F, G, A, B) a 
seg_out_2(6:0) - signál pro zobrazení příslušné oktávy na druhý displej (4, 5, 6, 7, 8)

![Screen Shot 2024-04-18 at 13 47 14](https://github.com/TheThingx/VHDL-projekt-PWM-Based_Tone_Generator/assets/56256388/95876134-b717-4f65-b602-4d5207149802)

2. Mux je modul, který zobrazuje na displejích příslušná data.
Uvnitř modulu je counter, který každou 1 ms přepíná výstup to_7seg na příslušné hodnoty ze vstupu note_in a oktave_in.
Zároveň se přepíná výstup to_anod_0, který určuje na jaké anodě v daný okamžik má být stav High. 

![Screen Shot 2024-04-18 at 14 05 38](https://github.com/TheThingx/VHDL-projekt-PWM-Based_Tone_Generator/assets/56256388/74d5a49d-de1b-4f2f-902a-8939e400a39a)

![Screen Shot 2024-04-18 at 15 28 20](https://github.com/TheThingx/VHDL-projekt-PWM-Based_Tone_Generator/assets/56256388/2a0012ee-7905-42dc-808b-d63bebdb4b02)

