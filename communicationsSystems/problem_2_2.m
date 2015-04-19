function problem_2_2()
% demonstrate the effect of passing a periodic signal through a
% linear, time invariant system. x is a triangular pulse train with
% period To = 2

figure 1;
t = -1:.01:1;
triangle = zeros(size(t));
triangle(t < 0) = t(t < 0) + 1;
triangle(t > 0) = -t(t > 0) + 1;
triangle(t == 0) = 1;
plot(t, triangle)

figure 2;
n = -10:10;
stem(n, coefficients(n));

figure 3;
y = coefficients(n) .* local_filter(n / 2);
stem(n, y);

figure 4;
hold on;
for N = 1:2:9
    yreconstructed = 0;
    for n = -N:N
    	yreconstructed = yreconstructed + coefficients(n) .* ...
            local_filter(n / 2) .* exp(-i * pi * t * n);
    end
    plot(t, yreconstructed)
end

end

function xn = coefficients(n)
    xn = 1/2 * sinc(n / 2) .^ 2;
end

function Hf = local_filter(f)
    Hf = 1 ./ sqrt(1 + f .^ 2);
end
