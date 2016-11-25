function  samplingVerify( fileName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
f = fopen(fileName);
raw = fread(f, 'uint16');
im = reshape(raw, [28, 28]);
im = im';
imshow(im)

end

