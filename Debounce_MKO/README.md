# Debounce_MKO

Modul Debounce_MKO implementuje debounce mechanismus pro tlačítko BTNC a také nastavuje dobu trvaní výstupu z generátoru tónu ve stavu High(enable výstup pro generátor En_PWM), tj jak dlouho vybraný tón zní. Modul celkem provádí tři procesy:
1. Debounce mechanismus.
Debounce mechanismus je implementován pomocí stavového automatu, který reaguje na změny vstupního signálu BTNC a provádí odpovídající přechody mezi stavy s použitím časovače. 
  
2. Proces pro řízení výstupního signálu.
Tlačítko BTNC pracuje ve dvou režimech: 
- pokud na vstupu PWM_Per, který určuje dobu trvaní signálu je 0, tlačítko BTNC funguje jako test-tlačítko, to znamená, že signál zní pouze dokud je tlačítko zmačknuto
- pokud na vstupu PWM_Per zvýšíme hodnotu o 1, tlačítko BTNC začíná fungovat jako start-tlačítko a signál na výstupu zní po dobu 1 vteřiny apod.

3. Proces pro dekódování délky trvaní PWM.
Vstup PWM_Per sleduje stisk tlačítek BTNL a BTNR a nastavuje délku trvání signálu En_PWM podle předem definovaných konstant (1s, 2s, 3s, 4s).
Počet period CLK100MHz = 1 sekunda/10ns = 100_000_000 period.

![Screen Shot 2024-04-18 at 15 42 45](https://github.com/arturshiva/pwm_VHDL/assets/56256388/64e5530f-bb1b-435c-af20-51e7b9ccfbf3)

![Screen Shot 2024-04-18 at 15 47 27](https://github.com/arturshiva/pwm_VHDL/assets/56256388/0ba1cf70-b3d4-495b-92f7-95fdcd540fd4)

![image](https://github.com/TheThingx/VHDL-projekt-PWM-Based_Tone_Generator/assets/56256388/99c3ecb5-22a5-4a7b-befa-3de27e455ad7)
