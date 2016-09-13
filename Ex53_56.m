% 单因素方差分析
clear
Y = load('data_ex53.txt');
[a,ni] = size(Y);
n=a*ni; %每行元素个数相等。
alpha=0.05

ybar = mean2(Y);
yrow = mean(Y,2);
SST = sum(sum(bsxfun(@minus, Y, ybar).^2))
SSA = ni*sum(bsxfun(@minus, yrow, ybar).^2)
SSE = SST-SSA

f = (SSA/(a-1))/(SSE/(n-a))
p = fcdf(f, a-1, n-a, 'upper')

if p>alpha
    fprintf('p=%.4f>=0.05，故接受原假设，各水平的效应没有显著差异。\n',p);
else
    fprintf('p=%.4f<0.05，故拒绝原假设，各水平的效应有显著差异。\n',p);
end