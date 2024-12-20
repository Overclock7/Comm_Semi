%% h_quant.mat = (14bit Quantized RRCF Coefficient / sps = 8 / span = 16 )
rx = load("h_quant.mat");
coff = rx.h_quant;

%% Array
sum = zeros(8,17);
product = zeros(8,17);

%% For Multiplier
mul = abs(3);

%% Do
for i = 1:8
    abs_coff = abs(coff(i:8:129));
    for k = 1:length(abs_coff)
        if k == 1
            product(i,k) = mul * abs_coff(k);
            sum(i,k) = 0 + product(i,k);
        else
            product(i,k) = mul * abs_coff(k);
            sum(i,k) = sum(i,k-1) + product(i,k);
        end
    end
end

%% Find Max Result of Array
n = max(sum,[],'all');
m = max(product,[],'all');