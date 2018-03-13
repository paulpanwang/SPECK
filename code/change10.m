clear;
clc;
X=textread('XMU_B_afterGB.txt','%s');
X=cell2mat(X);
Y=Neg_bin2dec(X,18)';