%zadA
Edges = [1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7;
         4, 6, 3, 4, 5, 5, 6, 7, 5, 6, 4, 6, 4, 7, 6];
numberOfElements = 7;
d = 0.85;
B = sparse(Edges(2,:), Edges(1,:),1,numberOfElements, numberOfElements);
I = speye(numberOfElements);
L = zeros(numberOfElements, 1);
for i = 1:numberOfElements
    L(i) = sum(B(:,i));
    L(i) = 1/L(i);
end
A = spdiags(L,0,numberOfElements, numberOfElements);
M = I - d*B*A;
b = zeros(1,7);
for i = 1:7
    b(i) = (1-d)/numberOfElements;
end

diary("sparse_test.txt")
whos A B I M b 
diary off

spy(B)
print -dpng spy_b

r = M/b;

bar(r)
print -dpng bar_r