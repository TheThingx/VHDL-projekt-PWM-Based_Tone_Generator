# VHDL project - PWM-Based Tone Generator

### Team members

* Nizamutdinov Artur 
* Bukva Tomáš
* Aujeský Filip
* Shishkova Viktoriia 

## Theoreticky uvod a cil projektu

Cilem projektu je vytvareni tonoveho generatoru a testovani jeho funkcnosti. Generator vyuziva princip Pulzně šířkove modulace, prevadejici sinusovou vlnu do tvaru navzorkovaneho signalu obdelnikoveho tvaru. Negativni pulz odpovida nizsi urovni (Low-level 0), pozitivni pulz odpovida vyssi urovni (High-level 1). 

![obd.png](Images/obd.png)

Nize je predstavena plna blokova schema PWM generatoru. 

![schematic.png](Images/schematic.png)


## Hardware description of demo application
Použita deska je NexysA7-50T. Audio výstup jack (J8) je připojen k reproduktoru, použivá filtr Sallen-Key Butterworth Low-pass 4th Order dovolujicí momo audio výstup. Digitalní vstup je PWM-signál a je vědený logickou 0 nebo 1. Nizkofrekvenční filtr na vstupu chova se jako rekonstrukční filtr převodu PWM digitalního signálu na analogové napětí na vystupu audio jacku.


![nexys.png](Images/nexys.png)

#### Aktivní prvky na desce:
- BTNC 

Tlačitko BTNC funguje jako zapináč posílaní signálu do reproduktoru a na schematu má označení START.
Podržením tlačitka BTNC kontrolujeme delku zvučení signálu když "delková "tlačitka jsou v nůle. 
Po nastavéní delky signálu pomocí tlačitek BTNL a BTNR pak zmačknutím spustíme signál a ten bude znět tu dobu, která byla nastavena. 

- BTNL/BTNR

"Tonová" tlačitka BTNL a BTNR fungují tak, že pomocí ně nastavíme delku znění tonu. BTNL ponižuje dobu trvaní tonu o 1 sekundu, BTNR naopak zvetšuje dobu trvaní o 1 sekundu. 

- SWITCHES

Switches mají na stárosti prepinání mezi noty (frekvenci). Binarni kombinaci switchu je moznost nastaveni jednoho z 32 tonu. 
Display je naprogramovan pomoci bloku 7seg. Vybrany ton se zobrazi na displaji cislem a pismenem. Aktivni je indikace pomoci LEDek.


## Softwarove bloky

* Debouncer counter 1/2.

  Bloky jsou odlisne

Debouncer 2 - amplituda signalu
Debouncer 1 - delka trvani signalu 
MKO - Monostabilni klopny obvod, generator ridici zmacknutim prostredniho tlacitka jak zpousti ten PWM signal. 
Tone generator - signal se deli na 1024 casti a stava z toho PWM signal. Vystup jde do monitoru.
Switche měni ton.

### Component(s) simulation

* Se zvysenim frekvenci je lepsi integrace => sinusovka je vice plynula. Rozmitani hlasitosti. 



* 



* 



* 


* 

*
## Instructions

Write an instruction manual for your application, including photos or a link to a video.

## References

1.
2. 
3. 
