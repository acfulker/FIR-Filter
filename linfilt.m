function [y, ty] = linfilt(h, th, x, tx)
%We find the time spacing for the input x.
Dtx = tx(2) - tx(1);
%We find the time spacing for the impulse response h.
Dth = th(2) - th(1);

if abs(Dtx - Dth) > 1e-5;
    error('ERROR: Time spacings are not equal!\n')
else
%We find the time lenght for the output signal y.
ly = length(x) + length(h) - 1;
%We find the lower time limit of x.
tx0 = tx(1);
%We find the lower time limit of h.
th0 = th(1);
%We calculate the lower time limit of y,
ty0 = tx0 + th0;
Dty = Dtx; %We find the time spacing for y.
%We set the time axis for y.
ty = [ty0:Dty:ty0+Dty*(ly-1)];
y = conv(h,x)*Dty; %And we calculate y
%Scale factor Dty given the discrete nature of Matlab
end