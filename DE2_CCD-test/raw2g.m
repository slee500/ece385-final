function raw2g(fileName)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
f = fopen(fileName);
raw = fread(f, 'uint16');
f = fclose('all');
%raw = raw(1:2:end);
raw = reshape(raw, [448, 640]);
im = bitshift(raw, 6, 'uint16');
im = bitshift(im, -8, 'uint16');
imshow(uint8(im))
end

