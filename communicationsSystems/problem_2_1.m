function problem_2_1(To, A, to)
% computer problem 2.1 fourier series
% the fourier series coefficients of the pulse wave defined by
%
% x(t) = A for |t| <= to
%        0 otherwise
%
% are
%
% xn = 1/2 * sinc(n/2)
%
% plot the original signal (the square wave)

if (nargin < 1)
    To = 4;
    A = 1;
    to = 1;
end

hold on;
figure 1;
x = -To/2:.01:To/2;
y = A * (abs(x) < to);
plot(x, y);

for N = 1:2:9
    xreconstructed = coefficient(0) / 2;
    for n = 1:N
    	xreconstructed = xreconstructed + coefficient(n) * cos(2 * pi * n * x / To);
    end
    plot(x, xreconstructed)
end

figure 2
hold on;
for n = -20:20
    stem(n, to * sinc(n * to / To) / To);
end
end

    

function xn = coefficient(n)
    xn = sinc(n / 2);
end