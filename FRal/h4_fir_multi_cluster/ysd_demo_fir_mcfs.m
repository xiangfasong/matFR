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

tic
% (3) feature ranking
options = [];
options.k = 5; %For unsupervised feature selection, you should tune
%this parameter k, the default k is 5.
options.nUseEigenfunction = 4;  %You should tune this parameter.
numF = size(ZLABxdata,2);
% FeaIndex = MCFS_p(ZLABxdata,numF,options);
rankx = rank_fir_multi_cluster(ZLABxdata);%,numF,options);
svgx = toc;

