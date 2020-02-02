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
Y = rank_dependence_guided( ZLABxdata );
rankx = rank_dependence_guided( ZLABxdata, 7);%, 0.5, 0.1 );
% [~,ranking]=sort(Y(:,1)+Y(:,2),'descend');
% rankx = ranking';
rankx

% % ----------------------------------------------
% S = dist( ZLABxdata' );
% S = -S./max( max(S) ); % it's a similarity
% nClass = 2;
% alpha = 0.5;
% beta = 0.2;
% nSel = 4;
% Y = DGUFS( ZLABxdata', nClass, S, alpha, beta, nSel );
% [~,ranking]=sort(Y(:,1)+Y(:,2),'descend');
% ranking = ranking';
% ranking
