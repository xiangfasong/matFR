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
ZLABxlabe = [ benLabel; malLabel ] + 1; % NOTE

% (3) data pre-processing
addpath('K:\matFIR\fir\mi_prepro\');

data = firDataNorm(ZLABxdata); % data normalization

data=firDiscretize(data, 10); % discretization

% (4) mutual information based feature ranking
% Input feature selection for classification problems
addpath('K:\matFIR\fir\mi_mex\')
ranking = rank_mi_min_redundancy( data,ZLABxlabe );
fprintf('...features are sorted from most to less importance...\n');
ranking

