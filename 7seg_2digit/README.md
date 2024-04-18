# 7seg_2digit

Celkový modul pro zobrazení noty(tónu) a oktávy na dva různé displeje je rozdělen na dvě části.

1. 
Divider je modul, který na vstup note přijímá binární hodnoty z přepínačů SW(4:0). Výstupem jsou dva signály:
seg_out_1(6:0) - signál pro zobrazení noty(tónu) na jeden displej (C, D, E, F, G, A, B) a 
seg_out_2(6:0) - signál pro zobrazení příslušné oktávy na druhý displej (4, 5, 6, 7, 8)

2. 
Mux je modul, který zobrazuje na displejích příslušná data.
Uvnitř modulu je counter, který každou 1 ms přepíná výstup to_7seg na příslušné hodnoty ze vstupu note_in a oktave_in.
Zároveň se přepíná výstup to_anod_0, který určuje na jaké anodě v daný okamžik má být stav High.  


