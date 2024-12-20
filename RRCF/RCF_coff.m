% Oversampling Rate
sps = 4;
% Num of Taps = sps * span
span = 16;
% Roll-off Factor
beta = 0.25;
% Num of Bits
M = 14;
% Raised Cosine Filter Design
h = rcosdesign(beta, span, sps, "sqrt");

% %% For Reduce Multiplier
% mul = 3;
% h = mul * h;
% 
% %% For Sign Control
% for i = 1:length(h)
%     temp = mod(i,8);
%     if temp == 3 || temp == 4 || temp == 7 || temp == 0
%         h(i) = -1*h(i);
%     end
% end

%% Quantizer Design (Signed : 1bit, Integer Part : 1bit, Fraction Part : 13bit) 
q = quantizer('DataMode','fixed','RoundMode','round','Format',[M,M-1]);
h_quant = quantize(q,h);
h_quant_bin = num2bin(q,h);

%% [h_quant,h_quant_bin] = Quantizer(h,M+1);

figure;
stem(h);
hold on;
stem(h_quant);
grid on;


figure;
idx = -0.5:1/1024:0.5-1/1024;
N_FFT = 1024;
plot(idx,10*log10(abs(fftshift(fft(h,N_FFT)))));
hold on;
plot(idx,10*log10(abs(fftshift(fft(h_quant,N_FFT)))));
grid on;

%% Make File
fid = fopen('filter_coeff_P3.txt','wt');
for k = 1:ceil(length(h_quant_bin))
    fprintf(fid,'%15s\n',h_quant_bin(k,:));
end
fclose(fid);

for m = 1:ceil(length(h_quant_bin)/sps)
    fname = sprintf('coeff_P3_%d.txt',m-1);
    fid = fopen(fname,'wt');
    for n = 1:sps
        index = (m-1)*sps+n;
        if index <= length(h_quant_bin)
            fprintf(fid,'%15s\n',h_quant_bin(index,:));
        else
            fprintf(fid,'%15s\n','000000000000000');
        end
    end
    fclose(fid);
end
