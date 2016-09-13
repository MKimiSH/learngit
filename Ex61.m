%多元方差分析
clear
X0 = load('data_ex61.txt');
% X = reshape(X,[],7);
ni = 3;
p = 7;
r = 5;

X = zeros(ni*r, p);
for i=1:r
    for j=1:ni
        X((i-1)*ni+j, :) = X0(i,(j-1)*p+1:j*p);
    end
end

xbar = mean(X);
xi_ = zeros(r,p);
A = zeros(p);
% B = zeros(p);
for i=1:r
    xi_(i,:) = mean(X((i-1)*ni+1:i*ni, :));
    tempA = bsxfun(@minus, X((i-1)*ni+1:i*ni, :), xi_(i,:));
    A = A + tempA'*tempA;
end
tempB = bsxfun(@minus, xi_, xbar);
B = ni*(tempB'*tempB);

W = det(A)/det(A+B)