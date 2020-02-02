% ------------------------------------------------------------------------
% Shaode Yu
% matFIR: a matlab toolbox for feature importance ranking and selection
% Email: yushaodemia@163.com
% Time:  12/28/2019
% ------------------------------------------------------------------------
clear; close all; clc;
warning off;

% (1) load data
addpath( genpath( 'K:\matFIR\bcdr\' ) );

ben = importfileBCDR( 'bcdr_beni_orpc.csv' );
benData = table2array( ben( :, 2:18 ) );
benLabel = zeros( size(ben,1), 1 );

mal = importfileBCDR( 'bcdr_mali_orpc.csv' );
malData = table2array( mal( :, 2:18 ) );
malLabel = ones( size(mal,1), 1 );

clear ben mal

% (2) data preparation
ZLABxdata = [ benData;  malData ];
ZLABxlabe = [ benLabel; malLabel ];

% (3) feature ranking
data = ZLABxdata;
num = size( data, 2 );
ranking = rank_fir_simul_ortho_clustering( data); %, num, 100,1000,50,50 );
ranking = ranking';
ranking
