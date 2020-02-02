function [ fnRanking ] = matFIR_fn( data, label, methodS )
% --------------------------------------------------------------------
% Shaode Yu
%  The function will compute 12 MI based FIR method in default
%  Input:
%       data, nSample * kFeature
%      label, nSample * 1 (NOTE: label = {0,1})
%    methodS, FIR methods
%
% Output:
%       fnRanking, {method_name} + {index_ranking}
% --------------------------------------------------------------------
if nargin < 3
    methodS = 'd1_mat_ttest';
end

if nargin < 2
    fprintf( 'Wrong: No enough input ... \n' );
    fnRanking = [];
    return;
else
    % data and label checking
    numSample = size( data, 1 );
    
    if abs( numSample - size(label,1) ) > 0
        fprintf( 'Wrong: Dimension not match  \n' );
        fnRanking = [];
        return;
    else
               
        % (1) fir
        selection_method = methodS;
        switch (selection_method)            
            % (1.01)
            case 'd1_mat_ttest'
                fprintf('...(d1_mat_ttest_1987)...\n')
                fprintf( '===*** 1987. Guinness, Gosset, Fisher, and small samples ...===\n' );
                fnRanking = rank_mat_ttest( data, label );
                fprintf('...................................................................\n');
            % (1.02)
            case 'd2_mat_entropy'
                fprintf('...(d2_mat_entropy_1951)...\n')
                fprintf( '===*** 1951. On information and sufficiency ...===\n' );
                fnRanking = rank_mat_entropy( data, label );
                fprintf('...................................................................\n');
            % (1.03)    
            case 'd3_mat_bhattacharyya'
                fprintf('...(d3_mat_bhattacharyya_1952)...\n')
                fprintf( '===*** 1952. A measure of asymptotic efficiency for tests of a hypothesis based on the sum of observations ...===\n' );
                fnRanking = rank_mat_bhattacharyya( data, label );
                fprintf('...................................................................\n');
            % (1.04)    
            case 'd4_mat_roc'
                fprintf('...(d4_mat_roc_1997)...\n')
                fprintf( '===*** 1997. The use of the area under the ROC curve in the evaluation of machine learning algorithms ...===\n' );
                fnRanking = rank_mat_roc( data, label );
                fprintf('...................................................................\n');
            % (1.05)                                 
            case 'd5_mat_wilcoxon'
                fprintf('...(d5_mat_wilcoxon_1992)...\n')
                fprintf( '===*** 1992. Individual comparisons by ranking methods ...===\n' );
                fnRanking = rank_mat_wilcoxon( data, label );
                fprintf('...................................................................\n');
            % (1.06)     
            case 'd6_mat_relieff'
                fprintf('...(d6_mat_relieff_1997)...\n')
                fprintf( '===*** 1997. Overcoming the myopia of inductive learning algorithms with RELIEFF ...===\n' );
                fnRanking = rank_mat_relieff( data, label );
                fprintf('...................................................................\n');
            % (1.07)   
            case 'd7_mat_lasso'
                fprintf('...(d7_mat_lasso_1996)...\n')
                fprintf( '===*** 1996. Regression shrinkage and selection via the lasso ...===\n' );
                fnRanking = rank_mat_lasso( data, label );
                fprintf('...................................................................\n');
            % (1.08)    
            case 'e1_fir_correlation'
                fprintf('...(e1_fir_correlation_2016)...\n')
                fprintf( '===*** 2016. Feature selection library (MATLAB toolbox) ...===\n' );
                fnRanking = rank_fir_correlation( data );
                fprintf('...................................................................\n');
            % (1.09)    
            case 'e2_fir_fisher'
                fprintf('...(e2_fir_fisher_2012)...\n')
                fprintf( '===*** 2012. Generalized fisher score for feature selection ...===\n' );
                fnRanking = rank_fir_fisher( data, label );
                fprintf('...................................................................\n');
            % (1.10)    
            case 'e3_fir_gini'
                fprintf('...(e3_fir_gini_1997)...\n')
                fprintf( '===*** 1997. Concentration and dependency ratios ...===\n' );
                fnRanking = rank_fir_gini( data, label );
                fprintf('...................................................................\n');
            % (1.11)    
            case 'e4_fir_KruskalWallis'
                fprintf('...(e4_fir_KruskalWallis_2013)...\n')
                fprintf( '===*** 2013. Nonparametric statistical methods ...===\n' );
                fnRanking = rank_fir_KruskalWallis( data, label );
                fprintf('...................................................................\n');
            % (1.12)
            case 'g1_fir_pair_wise_feature_proximity'
                fprintf('...(g1_fir_pair_wise_feature_proximity_2017)...\n')
                fprintf( '===*** 2017. An effective feature selection method based on pair-wise feature proximity for high dimensional low sample size data ...===\n' );
                fnRanking = rank_pair_wise_feature_proximity(data, label);
                fprintf('...................................................................\n');
            % (1.13)
            case 'g2_fir_max_min_local_structure_info'
                fprintf('...(g2_fir_max_min_local_structure_info_2013)...\n')
                fprintf( '===*** 2013. Minimum¨Cmaximum local structure information for feature selection ...===\n' );
                fnRanking = rank_fir_max_min_local_structure_info(data, label);
                fprintf('...................................................................\n');
            % (1.14)
            case 'g3_fir_local_learning_clustering'
                fprintf('...(g3_fir_local_learning_clustering_2010)...\n')
                fprintf( '===*** 2010. Feature selection and kernel learning for local learning-based clustering ...===\n' );
                fnRanking = rank_fir_local_learning_clustering(data);
                fprintf('...................................................................\n');
            % (1.15)
            case 'g4_fir_L12_regu_discrime'
                fprintf('...(g4_fir_L12_regu_discrime_2011)...\n')
                fprintf( '===*** 2011. L2,1-norm regularized discriminative feature selection for unsupervised learning ...===\n' );
                fnRanking = rank_fir_L12_regu_discrime(data);
                fprintf('...................................................................\n');    
            % (1.16)
            case 'g5_fir_eigenvector_centrality'
                fprintf('...(g5_fir_eigenvector_centrality)...\n')
                fprintf( '===*** 2016. Features Selection via Eigenvector Centrality ...===\n' );
                fnRanking = rank_fir_eigenvector_centrality(data, label);
                fprintf('...................................................................\n');  
            % (1.17)
            case 'g6_fir_infinite_latent'
                fprintf('...(g6_fir_infinite_latent_2017)...\n')
                fprintf( '===*** 2017. Infinite latent feature selection: A probabilistic latent graph-based ranking approach ...===\n' );
                fnRanking = rank_fir_infinite_latent(data, label);
                fprintf('...................................................................\n');
           % (1.18)
            case 'g7_fir_concave_minimization'
                fprintf('...(g7_fir_concave_minimization_1998)...\n')
                fprintf( '===*** 1998. Feature selection via concave minimization and support vector machines ...===\n' );
                fnRanking = rank_fir_concave_minimization_svm(data, label);
                fprintf('...................................................................\n');
           % (1.19)
            case 'g8_fir_infinite'
                fprintf('...(g8_fir_infinite_2015)...\n')
                fprintf( '===*** 2015. Infinite feature selection ...===\n' );
                fnRanking = rank_fir_infinite(data, label);
                fprintf('...................................................................\n');
           % (1.20)
            case 'g9_fir_ordinal_locality'
                fprintf('...(g9_fir_ordinal_locality_2017)...\n')
                fprintf( '===*** 2017. Unsupervised feature selection with ordinal locality ...===\n' );
                fnRanking = rank_fir_ordinal_locality(data);
                fprintf('...................................................................\n');
            % (1.21)
            case 'h1_fir_structured_graph_optimization'
                fprintf('...(h1_fir_structured_graph_optimization_2016)...\n')
                fprintf( '===*** 2016. Unsupervised feature selection with structured graph optimization ...===\n' );
                fnRanking = rank_structured_graph_optimization(data);
                fprintf('...................................................................\n');
            % (1.22)
            case 'h2_fir_laplacian_score'
                fprintf('...(h2_fir_laplacian_score_2005)...\n')
                fprintf( '===*** 2005. Laplacian score for feature selection ...===\n' );
                fnRanking = rank_fir_laplacian_score(data);
                fprintf('...................................................................\n');
            % (1.23)
            case 'h3_fir_simul_ortho_clustering'
                fprintf('...(h3_fir_simul_ortho_clustering_2015)...\n')
                fprintf( '===*** 2015. Unsupervised simultaneous orthogonal basis clustering feature selection ...===\n' );
                fnRanking = rank_fir_simul_ortho_clustering(data);
                fprintf('...................................................................\n');
            % (1.24)
            case 'h4_fir_multi_cluster'
                fprintf('...(h4_fir_multi_cluster_2010)...\n')
                fprintf( '===*** 2010. Unsupervised feature selection for multi-cluster data ...===\n' );
                fnRanking = rank_fir_multi_cluster(data);
                fprintf('...................................................................\n'); 
            % (1.25)
            case 'h5_fir_dependence_guided'
                fprintf('...(h5_fir_dependence_guided_2018)...\n')
                fprintf( '===*** 2018. Dependence guided unsupervised feature selection ...===\n' );
                fnRanking = rank_dependence_guided(data);
                fprintf('...................................................................\n');    
            % (1.26)
            case 'h6_fir_adaptive_structure_learning'
                fprintf('...(h6_fir_adaptive_structure_learning_2015)...\n')
                fprintf( '===*** 2015. Unsupervised feature selection with adaptive structure learning ...===\n' );
                fnRanking = rank_fir_adaptive_structure_learning(data);
                fprintf('...................................................................\n');  
            % (1.27)
            case 'k1_fir_joint_embed_learn_sparse_regression'
                fprintf('...(k1_fir_joint_embed_learn_sparse_regression_2011)...\n')
                fprintf( '===*** 2011. Feature selection via joint embedding learning and sparse regression ...===\n' );
                fnRanking = rank_joint_embed_learn_sparse_regression(data);
                fprintf('...................................................................\n');
            % (1.28)
            case 'k2_fir_spectrum_info_graph_laplacian'
                fprintf('...(k2_fir_spectrum_info_graph_laplacian_2007)...\n')
                fprintf( '===*** 2007. Spectral feature selection for supervised and unsupervised learning feature selection based on spectral information of graph laplacian ...===\n' );
                fnRanking = rank_spectrum_info_graph_laplacian(data);
                fprintf('...................................................................\n');
            % (1.29)
            case 'k3_fir_nonneg_spectral_analysis'
                fprintf('...(k3_fir_nonneg_spectral_analysis_2012)...\n')
                fprintf( '===*** 2012. Unsupervised feature selection using nonnegative spectral analysis ...===\n' );
                fnRanking = rank_fir_nonneg_spectral_analysis(data);
                fprintf('...................................................................\n');
            % (1.30)
            case 'k4_fir_robust_unsupervised'
                fprintf('...(k4_fir_robust_unsupervised_2013)...\n')
                fprintf( '===*** 2013. Robust unsupervised feature selection ...===\n' );
                fnRanking = rank_fir_robust_unsupervised(data);
                fprintf('...................................................................\n');                
            % (1.31) 
            otherwise
                fprintf( 'Please check the method \n' );
                fnRanking = [];
                fprintf('...................................................................\n');                
        end       
        
    end
    
end

end

