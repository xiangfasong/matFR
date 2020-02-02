function [ miRanking ] = matFIR_mi( data, label, methodS, mnorm, nbin )
% --------------------------------------------------------------------
% Shaode Yu
%  The function will compute 12 MI based FIR method in default
%  Input:
%       data, nSample * kFeature
%      label, nSample * 1 (NOTE: label = {0,1})
%    methodS, MI-based FIR methods
%      mnorm, method for normalization
%             (a) 'zscore':  mean=0; std=1 (default)
%             (b) 'normc':   sum( c_1 .* c_1 ) = 1
%             (c) 'linear':  (x-min (x) )/(max(x) - min(x) )
%             (d) 'clinear':  x/max(Aabs(x))
%       nbin, number of bins
%
% Output:
%       miRanking, {method_name} + {index_ranking}
% --------------------------------------------------------------------
if nargin < 5
    nbin = 8; % firDiscretize.m
end

if nargin < 4
    mnorm = 'zscore'; % firDataNorm.m
end

if nargin < 3
    methodS = 'b6_mi_max_dep_max_rel_min_red';
end

if nargin < 2
    fprintf( 'Wrong: No enough input in miFS10.m  \n' );
    miRanking = [];
    return;
else
    % data and label checking
    [ numSample, ~ ] = size( data );
    
    if abs( numSample - size(label,1) ) > 0
        fprintf( 'Wrong: Dimension not match  \n' );
        miRanking = [];
        return;
    else
       
        % (1) feature normalization
        data = firDataNorm( data, mnorm );
        
        % (2) data discretization
        data = firDiscretize( data, nbin );
        
        % (3) mi-based fir
        selection_method = methodS;
        switch (selection_method)            
            % (3.01)
            case 'a1_mi_battiti'
                fprintf('...(a1_mi_battiti_1994)...\n')
                fprintf( '===*** 1994. Using mutual information for selecting features in supervised neural net learning ...===\n' );
                miRanking = rank_battiti( data, label );
                fprintf('...................................................................\n');
            % (3.02)
            case 'a2_mi_step_wise'
                fprintf('...(a2_mi_step_wise_2004)...\n')
                fprintf( '===*** 2004. Feature ranking and best feature subset using mutual information ...===\n' );
                miRanking = rank_step_wise( data, label );
                fprintf('...................................................................\n');
            % (3.03)    
            case 'b1_mi_cond_infomax_learn'
                fprintf('...(b1_mi_cond_infomax_learn_2006)...\n')
                fprintf( '===*** 2006. Conditional infomax learning: An integrated framework for feature extraction and fusion ...===\n' );
                miRanking = rank_condition_infomax_learning( data, label+1 );
                fprintf('...................................................................\n');
            % (3.04)    
            case 'b2_mi_cond_mutual_info_max'
                fprintf('...(b2_mi_cond_mutual_info_max_2013)...\n')
                fprintf( '===*** 2013. Mutual information-based method for selecting informative feature sets ...===\n' );
                miRanking = rank_condition_mutual_info_max( data, label+1 );
                fprintf('...................................................................\n');
            % (3.05)                                 
            case 'b3_mi_mrmr_global'
                fprintf('...(b3_mi_mrmr_global_2014)...\n')
                fprintf( '===*** 2014. Effective global approaches for mutual information based feature selection ...===\n' );
                miRanking = rank_mrmr_global( data, label+1 );
                fprintf('...................................................................\n');
            % (3.06)     
            case 'b4_mi_max_relevance'
                fprintf('...(b4_mi_max_relevance_battiti_1994)...\n')
                fprintf( '===*** 1994. Using mutual information for selecting features in supervised neural net learning ...===\n' );
                miRanking = rank_max_relevance( data, label+1 );
                fprintf('...................................................................\n');
            % (3.07)   
            case 'b5_mi_min_redundancy'
                fprintf('...(b5_mi_min_reduandancy_2014)...\n')
                fprintf( '===*** 2014. Effective global approaches for mutual information based feature selection ...===\n' );
                miRanking = rank_mi_min_redundancy( data, label+1 );
                fprintf('...................................................................\n');
            % (3.08)    
            case 'b6_mi_max_dep_max_rel_min_red'
                fprintf('...(b6_mi_max_dep_max_rel_min_red_2005)...\n')
                fprintf( '===*** 2005. Feature selection based on mutual information: Criteria of max-dependency, max-relevance, and min-redundancy ...===\n' );
                miRanking = run_max_dep_max_rel_min_red( data, label+1 );
                fprintf('...................................................................\n');
            % (3.09)    
            case 'b7_mi_quad_program'
                fprintf('...(b7_mi_quad_program_2010)...\n')
                fprintf( '===*** 2010. Quadratic programming feature selection ...===\n' );
                miRanking = run_quad_program( data, label );
                fprintf('...................................................................\n');
            % (3.10)    
            case 'b8_mi_min_redundancy'
                fprintf('...(b8_mi_min_redundancy_2005)...\n')
                fprintf( '===*** 2005. Minimum redundancy feature selection from microarray gene expression data ...===\n' );
                miRanking = run_min_redundancy( data, label+1 );
                fprintf('...................................................................\n');
            % (3.11)    
            case 'b9_mi_joint'
                fprintf('...(b9_mi_joint_2014)...\n')
                fprintf( '===*** 2014. Effective global approaches for mutual information based feature selection ...===\n' );
                miRanking = run_joint_mutual_info( data, label+1 );
                fprintf('...................................................................\n');
            % (3.12)   
            case 'c1_mi_giorgio'
                fprintf('...(c1_mi_giorgio_2018)...\n')
                fprintf( '===*** 2018. Feature Selection Library (MATLAB Toolbox) ...===\n' );
                miRanking = rank_mi_giorgio(data, label);       
                fprintf('...................................................................\n');                
            % (3.13) 
            otherwise
                fprintf( 'Please check the method \n' );
                miRanking = [];
                fprintf('...................................................................\n');                
        end       
        
    end
    
end

end

