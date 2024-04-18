# Debounce_MKO

Modul Debounce_MKO implementuje debounce mechanismus pro tlačítko BTNC a také nastavuje dobu trvaní výstupu z generatoru tónu ve stavu High(enable výstup pro generátor En_PWM), tj jak dlouho vybraný tón zní. Modul celkem provadí tři procesy:
1. Debounce mechanismus.
Debounce mechanismus je implementován pomocí stavohého automatu, který reaguje na změny vstupního signálu BTNC a provádí odpovídající přechody mezi stavy s použitím časovače. 
  
2. Proces pro řizení výstupního signálu.
Tlačitko BTNC pracuje ve dvou režimech: 
- pokud na vstupu PWM_Per, který určuje dobu trvaní signálu je 0, tlačitko BTNC funguje jako test-tlačitko, to znamená, že signál zní pouze dokud je tlačitko zmačknuto
- pokud na vstupu PWM_Per zvyšeme hodnotu o 1, tlačitko BTNC začíná fungovat jako start-tlacitko a signál na výstupu zní po dobu 1 vteřiny apod.

3. Proces pro dekódování délky trvaní PWM.
Vstup PWM_Per sleduje stisk tlačitek BTNL a BTNR a nastavuje délku trvání signálu En_PWM podle předem definovaných konstant (1s, 2s, 3s, 4s).
Pocet period CLK100MHz = 1 sekudna/10ns = 100_000_000 period.

![Screen Shot 2024-04-18 at 15 42 45](https://github.com/arturshiva/pwm_VHDL/assets/56256388/64e5530f-bb1b-435c-af20-51e7b9ccfbf3)

![Screen Shot 2024-04-18 at 15 47 27](https://github.com/arturshiva/pwm_VHDL/assets/56256388/0ba1cf70-b3d4-495b-92f7-95fdcd540fd4)

