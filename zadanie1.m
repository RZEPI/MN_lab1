clear all
close all
a=2;
r_max=a/2;
n_max=200;
x = zeros(1, n_max);
y = zeros(1, n_max);
r = zeros(1, n_max);
numberOfDrawings = 0;
drawings = zeros(1, n_max);
hold on
axis equal
axis([0 a 0 a])
n = 1;
rand(1)
rand(5)
while n <= n_max
    X=rand*a;
    Y=rand*a;
    R=rand*r_max;
    numberOfDrawings = numberOfDrawings + 1;
    if(Y+R < a && X+R < a && X-R > 0 && Y-R > 0)
        i = 1;
        isIntersection = false;
        while i <= n
            distance = sqrt((x(i)-X)^2 + (y(i)-Y)^2);
            if distance < r(i)+R
                isIntersection = true;
                break
            end
            i = i + 1;
        end
        if ~isIntersection
            drawings(n) = numberOfDrawings;
            numberOfDrawings = 0;
            x(n) = X;
            y(n) = Y;
            r(n) = R;
            lab2(X, Y, R)
            pause(0.001)
            n = n+1;
        end
    end
end
%zadanieA
figure;
i = 1;
areas = zeros(1, n_max);
while i <= n_max
    areas(i) = pi*r(i)^2;
    i=i+1;
end
cumulatedAreas = cumsum(areas);
plot(1:n_max,cumulatedAreas);
title("Powierzchnia całkowita okręgów");
xlabel("Liczba narysowanych okręgów");
ylabel("Powierzchnia");

%zadanieB
figure;
cumulatedDrawings = cumsum(drawings);
for i=1:n_max
    cumulatedDrawings(i) = cumulatedDrawings(i)/i;
end
plot(1:n_max, cumulatedDrawings);
title("Średnia liczba losowań");
xlabel("Liczba narysowanych okręgów");
ylabel("Liczba losowań")