clear all
clc

% Num of Sym
N = 1000;

% Constellation Table [1 2 4 3]
E = 1/sqrt(2);
constellation = E.*[1+1j -1+1j 1-1j -1-1j];

% Oversampling Rate
sps = 8;

% Num of Taps = sps * span
span = 16;

% Roll-off Factor
beta = 0.25;

% Tx Symbol Generation
tx_sym = constellation(randi([1 4],[1 N]));

% Zero Padding
% 1 2 3 4 1 2 3 4
% 0 0 0 0 0 0 0 0  ==> 1 0 0 0 | 2 0 0 0 | 3 0 0 0 | 4 0 0 0  
% 0 0 0 0 0 0 0 0
% 0 0 0 0 0 0 0 0
tx_sym_padded = reshape([tx_sym;zeros(sps-1,N)],[1,N*sps]);

% Raised Cosine Filter Design
h = rcosdesign(beta, span, sps, 'normal');

% Pulse Shaping
tx_out = conv(h,tx_sym_padded);

figure;
plot(real(tx_out(1:1000)));
eyediagram(tx_out(sps*span/2 + 1 : end - sps*span),2*sps);
figure;
plot(real(tx_out),imag(tx_out));
scatterplot(tx_out(sps*span/2 + 1 : end - sps*span),sps,0);