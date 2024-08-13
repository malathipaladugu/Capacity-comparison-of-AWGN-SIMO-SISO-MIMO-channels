close all;
clear all;

SNR=0:5:40%values of snr in db with spacing of 5 db
h = 1/sqrt(2)*(rand(4, 1) +1i*rand(4,1));%declaring random channel coefficient
i=0;
a=size(SNR);
b=a(2);%declaring size of snr
SNRlin=zeros(1,b);%creating array for snr
capacity=zeros(1,b);%creating array for capacity
m=norm(h);%defining norm of random channel coefficient
while(i<b)
    i=i+1;
SNRlin(i)=10^(SNR(i)/10);%conversion of snr from db
capacity_simo(i)=log2(1+(m^2*SNRlin(i)));%capacity of SIMO wireless channel
capacityawgn(i)=log2(1+4*SNRlin(i));%capacity of SIMO awgn channel
capacity_siso(i)=log2(1+SNRlin(i));%Capacity of SISO wireless channel
end
figure
h2 = plot(SNR,capacity_simo,'r');%plotting snr in db vs capacity
hold on
h1 = plot(SNR,capacityawgn,'g'); %plotting snr in db vs capacity of awgn channel
h3 = plot(SNR,capacity_siso,'b'); %plotting snr in db vs capacity of awgn channel

title('Capacity vs SNR(dB) comparison of AWGN, SISO, SIMO systems');
xlabel('SNR (dB)'); % Title of x-axis
ylabel('Capacity'); % Title of y-axis
legend([h1, h2, h3], 'capacity AWGN', 'capacity SIMO', 'capacity SISO', 'Location', 'northwest');
hold off

%%Observation: The channel capacity of AWGN > capacity of SIMO > capacity of SISO"
