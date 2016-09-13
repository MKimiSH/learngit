% �����ط��������$n_i$��ͬ
clear
Y = load('data_ex57.txt');
[a,nimax] = size(Y);

ni = zeros(a,1);
yrow = zeros(a,1);
ysum = 0;
SSE = 0;
alpha = 0.05;
for i=1:a
    ni(i) = nimax-nnz(isnan(Y(i,:)));
    yrow(i) = mean( Y(i,1:ni(i)) );
    SSE = SSE + sum( (bsxfun(@minus, Y(i,1:ni(i)),yrow(i))).^2 );
    ysum = ysum+sum(Y(i,1:ni(i)));
end
n = sum(ni);
ybar = ysum/n;

SST = sum(sum((Y-ybar).^2, 'omitnan'))
SSA = SST-SSE
SSE

f = (SSA/(a-1))/(SSE/(n-a))
p = fcdf(f, a-1, n-a, 'upper')

if p>alpha
    fprintf('p=%f>=0.05���ʽ���ԭ���裬��ˮƽ��ЧӦû���������졣\n',p);
else
    fprintf('p=%f<0.05���ʾܾ�ԭ���裬��ˮƽ��ЧӦ���������졣\n',p);
end