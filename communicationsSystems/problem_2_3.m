function problem_2_3(w)

if nargin < 1
    w = -1:.01:1;
end

t = -2:.01:2;

figure 1;
subplot(2, 2, 1);
plot(w, abs(x1(w)));
title('x1 magnitude');

subplot(2, 2, 2);
plot(t, input1(t))
title('x1 fft magnitude');

subplot(2, 2, 3);
plot(w, angle(x1(w)));
title('x1 phase');

subplot(2, 2, 4);
plot(t, input1(t));
title('x1 fft phase');

figure 2;
subplot(2, 1, 1);
plot(w, abs(x2(w)));
title('x2 magnitude');
subplot(2, 1, 2);
plot(w, angle(x2(w)));
title('x2 phase');

end

function x = x1(w)
    x = sinc(w) + (-i * exp(i * w) + (1 ./ w) - exp(i * w) ./ w) ./ w;
end

function x = x2(w)
    x = i * (exp(-2 * i * w) - i * exp(-i * w) ./ w + i ./ w) ./ w;
end

function x = input1(t)
    x = zeros(size(t))
    x(t > -1) = t(t > -1) + 1
    x(t >= 0 && t < 1) = 1;
    x(t >= 1) = 0;
end

function x = input2(t)
    x = zeros(size(t));
    x(t < 0) = 0;
    x(t > 0 && t <= 1) = t(t > 0 && t <= 1);
    x(t > 1 && t <= 2) = 1;
    t(t > 2) = 0;
end
