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
% X = ZLABxdata';
% num = size( X, 2 );
% k = 5;
% distX = L2_distance_1( X, X );
% [ distX1, idx ] = sort( distX, 2 );
% A = zeros( num );
% for i = 1 : num
%     di = distX1( i, 2:k+2 );
%     id = idx( i, 2:k+2 );
%     A( i, id ) = ( di(k+1) - di )/( k * di(k+1) - sum( di(1:k) ) + eps );
% end
% 
% A0 = 0.5 * ( A + A' );
% wFeat = fsSpectrum( A0, X', -1);
% [~, ranking] = sort( wFeat, 'ascend' );
% ranking = ranking'

rankx = rank_spectrum_info_graph_laplacian( ZLABxdata )


