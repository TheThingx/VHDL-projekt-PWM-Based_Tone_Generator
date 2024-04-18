% jednoduchý program pro rozdělené časové konstanty sin pro projekt VHDL
% PWM -> sin converter
% pro rychlou a jednoduchou implementaci k optimalizaci časové základny

N = 16; %nastavení počtu rozdělení
k = zeros(1,N);

for i = 1:1:N-1 %rozdělení na části
f = round(500*sind(360*i/N));
k(i+1) = f;
end

length(k);
array = strjoin(string(k), ','); %array oddělená čárkama

% rozdělení na řádky pro jednoduchou implementaci do kódu
line1 = 'constant divided_points : integer := ' + string(length(k)) + ' ;';
line2 = ' type Time_array is array(1 to divided_points) of Integer;';
line3 = ' signal T_array : Time_array := (' + array + ');';

line = line1 + newline + line2 + newline + line3;
clipboard('copy', line); % zkopíruje do schánky a zobrazí
disp(line)
