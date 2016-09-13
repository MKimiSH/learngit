% �����ط������
clear
Y = load('data_ex53.txt');
[a,ni] = size(Y);
n=a*ni; %ÿ��Ԫ�ظ�����ȡ�
alpha=0.05

ybar = mean2(Y);
yrow = mean(Y,2);
SST = sum(sum(bsxfun(@minus, Y, ybar).^2))
SSA = ni*sum(bsxfun(@minus, yrow, ybar).^2)
SSE = SST-SSA

f = (SSA/(a-1))/(SSE/(n-a))
p = fcdf(f, a-1, n-a, 'upper')

if p>alpha
    fprintf('p=%.4f>=0.05���ʽ���ԭ���裬��ˮƽ��ЧӦû���������졣\n',p);
else
    fprintf('p=%.4f<0.05���ʾܾ�ԭ���裬��ˮƽ��ЧӦ���������졣\n',p);
end