freq_data=readtable("readings1.xlsx");

figure;
semilogx(freq_data.freq,freq_data.gain);
yline(0);
ylabel("Gain(in dB)", 'FontSize', 15); xlabel("Frequency", 'FontSize', 15);
grid("on");

figure;
semilogx(freq_data.freq,freq_data.phase2);
yline(-180);
ylabel("Phase", 'FontSize', 15); xlabel("Frequency", 'FontSize', 15);
grid("on");

%Create Transfer function of compensator
%First Order
%Zeroes
% z1=1e3*6.28; z2=0;
% %Poles
% p1=100*6.28; p2=0;
% 
% a1=z1+z2;
% a2=z1*z2;
% b1=p1+p2;
% b2=p1*p2;
% trans_func=tf([1 a1],[1 b1]);
% figure;
% bode(trans_func);

%2nd order
z1=70*6.28; z2=75*6.28;
p1=2*6.28; p2=3*6.28;
%z1=10*6.28; z2=20*6.28;
%p1=0.1*6.28; p2=0.2*6.28;
a1=z1+z2;
a2=z1*z2;
b1=p1+p2;
b2=p1*p2;
trans_func=tf([1 a1 a2],[1 b1 b2]);
figure;
bode(trans_func);

%Combine compensator with obtained data
comb_gain=freq_data.gain;
close_gain=freq_data.gain;
omega_arr=freq_data.omega;
freq_arr=freq_data.freq;
phase_arr=freq_data.phase2;
close_phase=freq_data.phase2;
for f=1:length(freq_arr)
    s=omega_arr(f);
    comb_gain(f)=comb_gain(f)+20*log10(0.5*(s^2+a1*s+a2)/(s^2+b1*s+b2));
    close_gain(f)=close_gain(f)+20*log10(0.5*(s^2+a1*s+a2)/((s^2+b1*s+b2)+close_gain(f)*0.5*(s^2+a1*s+a2)));
    phase=atan2d(a1*s,a2-s^2)-atan2d(b1*s,b2-s^2);
    phase_arr(f)=phase_arr(f)+phase;
    close_phase(f)=phase_arr(f)+atan2d(freq_data.vout(f),freq_data.vin(f));
    
end

figure;
semilogx(freq_arr,comb_gain);
yline(0);
ylabel("Gain(in dB)", 'FontSize', 15); xlabel("Frequency", 'FontSize', 15);
grid("on");

figure;
semilogx(freq_arr,phase_arr);
yline(-180);
ylabel("Phase", 'FontSize', 15); xlabel("Frequency", 'FontSize', 15);
grid("on");


