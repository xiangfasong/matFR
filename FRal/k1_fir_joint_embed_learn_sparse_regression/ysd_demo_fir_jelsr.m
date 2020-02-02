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
data = ZLABxdata;

% (3) feature ranking
options.KernelType = 'Gaussian';
options.t = optSigma(data);
W_ori = constructKernel(data,[],options);

ReducedDim = 17;
alpha = 2.1;    % 1.5 ~ 2.4
beta = 1e-2;  % 1e-2 ~ 1e-1

[W_compute, Y, ~] = jelsr( data, W_ori, 12, alpha, beta );
[ ~, ranking ] = sort( sum( W_compute.*W_compute, 2 ), 'ascend' );
ranking = ranking';
ranking

rankx = rank_joint_embed_learn_sparse_regression(data, 12);
rankx

