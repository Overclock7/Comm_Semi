
function [quant,quant_bin]= Quantizer(h,M)

divider = 2^(M-1);

temp = round(h .* divider);
quant = temp / divider;
quant_bin = dec2bin(temp,M);
quant_bin = quant_bin(:,end-(M-1):end);