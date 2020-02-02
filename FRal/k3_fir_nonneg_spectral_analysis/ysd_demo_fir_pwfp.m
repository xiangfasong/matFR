% ------------------------------------------------------------------------
% Shaode Yu
% matFIR: a matlab toolbox for feature importance ranking and selection
% Email: yushaodemia@163.com
% Time:  12/28/2019
% ------------------------------------------------------------------------
clear; close all; clc;
warning off;

% (1) load data
addpath( genpath( 'K:\FIRs\_aFS\aplan\a_bcdr\' ) );

ben = importfileBCDR( 'abcdr_01_beni.csv' );
benData = table2array( ben( :, 2:18 ) );
benLabel = zeros( size(ben,1), 1 );

mal = importfileBCDR( 'abcdr_01_mali.csv' );
malData = table2array( mal( :, 2:18 ) );
malLabel = ones( size(mal,1), 1 );

clear ben mal

% (2) data preparation
ZLABxdata = [ benData;  malData ];
ZLABxlabe = [ benLabel; malLabel ];

% (3) feature ranking
X = ZLABxdata'; % dim*num
c = 4;
num = size(X,2);
k = 5;
distX = L2_distance_1(X,X);
[distX1, idx] = sort(distX,2);
A = zeros(num);
for i = 1:num
    di = distX1(i,2:k+2);
    id = idx(i,2:k+2);
    A(i,id) = (di(k+1)-di)/(k*di(k+1)-sum(di(1:k))+eps);
end

A0 = (A+A')/2;

[Label,L1,~] = sc(A0,c);

tLabel = zeros(num,c);
for i = 1:num
    tLabel(i,Label(i)) = 1;
end
W = zeros(size(X,1),c);
aa = 0.1;
bb = 1;
cc = 1000;
[~,Wa,~] = AAAI2012(X,full(L1),tLabel,W,100,aa,bb,cc);
[~, ranking] = sort(sum(Wa.*Wa,2),'descend');
ranking = ranking';
ranking

data = ZLABxdata;
rankx =rank_fir_nonneg_spectral_analysis(data)

