%{
1. Plot the time and frequency domain components of the music you created;  
2. Explain the output of your graphs according to your design.  
3. Plot the spectrogram of the music you created and explain your findings from the 
generated spectrogram. 

Extra credit challenges (15 points):  
a. Add white Gaussian noise to your music and analyze and plot the output music in both time 
and frequency domains. Explain the signal to noise ratio of your output music.  
b. Design a filter to remove noise  
c. Analyze and plot the music in both time and frequency domain.  
%}
close all;
%% Creating Music

FS=8000; % sampling frequency
T = 1/FS; % Sampling period 

% listed below are the notes used to make the song 
c=sin(2*pi*523.25*(0:0.0000625:0.5));
d=sin(2*pi*587.33*(0:0.0000625:0.5));
e=sin(2*pi*659.25*(0:0.0000625:0.5));
ed =sin(2*pi*0*(0:0.0000625:0.5));

%generate 3 lines of music by composing the notes together

line1 = [e, d, c, d, e, e, e, ed];
line2 = [d, d];
song=[line1, line2]; % generate the song
%sound(song, FS); %uncomment to listen to the song on runtime. 
audiowrite('mary.wav', song, FS); % output the final music notes as a wave form

f1 = figure;
f2 = figure;
f3 = figure;
%% time domain 
[y, fs] = audioread('mary.wav'); %this will read the music and save the input signal and sampling frequency
t = linspace(0, length(y)/fs, length(y)); % time vector ( from 0 to 10.0013 which is the length of the song and linspace creates 80010 evenly spaced numbers in between; hence a time vector)
figure(f1);
subplot(2,2,1);
plot(t,y);
title("Time Domain Without Noise");
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

% Additional individual plot
figure;
plot(t,y);
title("Time Domain Without Noise");
xlabel('Time(s)');
ylabel('Amplitude');
grid on; 
savefig("TimeDomain_noNoise.fig");
%% freq domain
nfft = 1024; % number of samples
f = linspace(0, fs, nfft); % freq vector(0 to 8000 which is the range of the sampling freq . it will create 1024 even spaces between that range) 
Y = abs(fft(y, nfft)); 
figure(f1);
subplot(2,2,2);
plot(f(1:nfft/2),Y(1:nfft/2)); % The reasons the number of samples is in half because the human ear cannot hear that high in frequency. 
title("Frequency Domain Without Noise");
xlabel('Freq(Hz)');
ylabel('abs');
grid on;
% Additional individual plot
figure;
plot(f(1:nfft/2),Y(1:nfft/2)); % The reasons the number of samples is in half because the human ear cannot hear that high in frequency. 
title("Frequency Domain Without Noise");
xlabel('Freq(Hz)');
ylabel('abs');
grid on;
savefig("FreqDomain_noNoise.fig");
%%  spectrogram
figure(f1);
subplot(2,2,[3:4]);
spectrogram(y, hanning(2000), [], [], fs, 'yaxis'); % plotting of the spectrogram. (Used hanning window 2000 to get a good balance between freq and time resolution)
title('Spectrogram of Input Signal Without Noise');
savefig("OverviewofInputSignal.fig");

% Additional individual plot
figure;
spectrogram(y, hanning(2000), [], [], fs, 'yaxis'); % plotting of the spectrogram. 
title('Spectrogram of Input Signal');
savefig("SpectrogramOfNoNoise.fig");
%% 
% adding white noise
SNR = 10; % signal to noise ratio ( 10db)
st_nn = awgn(y, SNR, 'measured'); % used the function "Add white gaussian noise" Look up on help 

%sound(st_nn, fs); % unccomment to hear the input with noise 
audiowrite('mary-white-noise.wav', st_nn, FS);

% Plotting in time domain
figure(f2)
subplot(2,2,1);
plot(t, st_nn)
xlabel('Time(s)');
ylabel('Amplitude');
title('Time Domain Signal After Addition of Noise');
grid on;

% Additional individual plot
figure;
plot(t, st_nn)
xlabel('Time(s)');
ylabel('Amplitude');
title('Time Domain Signal After Addition of Noise');
grid on;
savefig("TimeDomain_WithNoise.fig");

% plotting in freq domain
Yx = abs(fft(st_nn, nfft));
figure(f2);
subplot(2,2,2);
plot(f(1:nfft/2),Yx(1:nfft/2)); % The reasons the number of samples is in half because the human ear cannot hear that high in frequency. 
title("Frequency Domain Signal After Addition of Noise");
xlabel('Freq (Hz)');
ylabel('abs');
grid on;

%spectrogram 
figure(f2);
subplot(2,2,[3:4]);
spectrogram(st_nn, hanning(2000), [], [], fs, 'yaxis'); % plotting of the spectrogram. (Used hanning window 2000 to get a good balance between freq and time resolution)
title('Spectrogram of Noise Input Signal');
savefig("OverviewofNoiseInputSignal.fig");

%Additional individual plot
figure;
plot(f(1:nfft/2),Yx(1:nfft/2)); % The reasons the number of samples is in half because the human ear cannot hear that high in frequency. 
title("Frequency Domain Signal After Addition of Noise");
xlabel('Freq (Hz)');
ylabel('abs');
grid on;
savefig("FreqDomain_WithNoise.fig");

% Additional individual plot of spectrogram 
figure;
spectrogram(st_nn, hanning(2000), [], [], fs, 'yaxis'); % plotting of the spectrogram. 
title('Spectrogram of Noise Input Signal');
savefig("SpectrogramOfNoise.fig");
%%
% filtering out the white noise 
yu = bandpass(st_nn, [275 350], fs);
%sound(yu, fs); %uncomment to play the filtered version of the signal with noise 

% plotting in time domain
figure(f3);
subplot(2,2,1);
plot(t, yu);
xlabel('Time(s)');
ylabel('Amplitude');
title('Time Domain Signal After Filtering of Noise');
grid on;

%Additional Individual Plot
figure;
plot(t, yu);
xlabel('Time(s)');
ylabel('Amplitude');
title('Time Domain Signal After Filtering of Noise');
grid on;
savefig("TimeDomain_WithFilteredNoise.fig"); 
audiowrite('mary-filitered-white-noise.wav', song, FS);

% plotting in freq domain
yc = abs(fft(yu, nfft));
figure(f3);
subplot(2,2,2);
plot(f(1:nfft/2),yc(1:nfft/2));
title("Frequency Domain After Filtering of Noise");
xlabel('Freq(Hz)');
ylabel('abs');
grid on;

%Additional Individual Plot
figure;
plot(f(1:nfft/2),yc(1:nfft/2));
title("Frequency Domain After Filtering of Noise");
xlabel('Freq(Hz)');
ylabel('abs');
grid on;
savefig("FreqDomain_WithFilteredNoise.fig");

% spectrogram
figure(f3);
subplot(2,2,[3:4]);
spectrogram(yu, hanning(2000), [], [], fs, 'yaxis'); % plotting of the spectrogram. (Used hanning window 2000 to get a good balance between freq and time resolution)
title('Spectrogram of Filitered Input Signal');
savefig("OverviewofFiliteredInputSignal.fig");

% Additional individual plot of spectrogram
figure;
spectrogram(yu, hanning(2000), [], [], fs, 'yaxis'); % plotting of the spectrogram. 
title('Spectrogram of Filtered Input Signal');
savefig("SpectrogramOfFiliteredNoise.fig");



















