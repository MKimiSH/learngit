% 双因素有交互作用方差分析
clear
X = load('data_ex60.txt');

alpha = 0.05;
r=2;
s=3;
t=18;
xbar = mean2(X);
xi__ = [mean2(X(:,1:3)); mean2(X(:,4:6))];
x_j_ = [mean2(X(:,1:3:4)); mean2(X(:,2:3:5)); mean2(X(:,3:3:6))];
xij_ = mean(X);
xij_ = reshape(xij_, [3,2])';

SST = sum(sum(bsxfun(@minus, X, xbar).^2))
SSA = s*t*(sum(bsxfun(@minus, xi__, xbar).^2))
SSB = r*t*(sum(bsxfun(@minus, x_j_, xbar).^2))
SSAB = 0; %实在想不出来怎么写bsxfun了
for i=1:r
    for j=1:s
        SSAB = SSAB + (xij_(i,j) - xi__(i) - x_j_(j) + xbar)^2;
    end
end
SSAB = SSAB*t
SSE = SST-SSA-SSB-SSAB
% SSe = sum(sum((bsxfun(@minus, X, mean(X))).^2))

EF = SSE/(r*s*(t-1));

FA = SSA/(r-1)/EF
FB = SSB/(s-1)/EF
FAB= SSAB/((r-1)*(s-1))/EF

pA = fcdf(FA, r-1, r*s*(t-1), 'upper')
pB = fcdf(FB, s-1, r*s*(t-1), 'upper')
pAB= fcdf(FAB, (r-1)*(s-1), r*s*(t-1), 'upper')

if pA>alpha
    fprintf('pA=%f>=0.05，故接受原假设H01，因素A各水平的效应没有显著差异。\n',pA);
else
    fprintf('pA=%f<0.05，故拒绝原假设H01，因素A各水平的效应有显著差异。\n',pA);
end

if pB>alpha
    fprintf('pB=%f>=0.05，故接受原假设H02，因素B各水平的效应没有显著差异。\n',pB);
else
    fprintf('pB=%f<0.05，故拒绝原假设H02，因素B各水平的效应有显著差异。\n',pB);
end

if pAB>alpha
    fprintf('pAB=%f>=0.05，故接受原假设H03，两个因素交互作用没有显著影响。\n',pAB);
else
    fprintf('pAB=%f<0.05，故拒绝原假设H03，两个因素交互作用有显著影响。\n',pAB);
end