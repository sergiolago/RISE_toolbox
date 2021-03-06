%% introduction
% 1- throughout, we use a model with multiple regimes. The model with
% constant parameter is just a special case
% 2- we illustrate: unconditional forecasts, hard conditions, soft
% conditions
% 3- we abstract from parameter uncertainty, which is the default in the
% toolbox but just takes more time to run 
% to do: 
% - check that lower bound< central tendency < upper bound
% - sort out the steady state thing ...
%% unconditional forecasts
% the forecast will be done moving through all possible states according to
% the probabilities
[cond_fkst_db,cond_fkst_mean_db,uncond_fkst_db]=forecast(TwoChain,'forecast_paths',10,...
    'forecast_param_uncert',false);
%% Imposing a central tendency
% conditioning information and markov switching not fully ready yet so you
% have to pick a regime 
[cond_fkst_db,cond_fkst_mean_db,uncond_fkst_db]=forecast(TwoChain,'forecast_paths',10,...
    'forecast_param_uncert',false,...
    'forecast_conditional_info',...
    struct('central_tendency',rise_time_series('2010q1',zeros(12,1),'RN3M_NW')),...
    'forecast_regime',3);
%% hard conditions
% conditioning information and markov switching not fully ready yet so you
% have to pick a regime 
hard=rise_time_series('2010q1',zeros(12,1),'RN3M_NW');
[cond_fkst_db,cond_fkst_mean_db,uncond_fkst_db]=forecast(TwoChain,'forecast_paths',10,...
    'forecast_param_uncert',false,...
    'forecast_conditional_info',...
    struct('central_tendency',hard,'lower_bound',hard,'upper_bound',hard),...
    'forecast_regime',3);
%% soft conditions
% conditioning information and markov switching not fully ready yet so you
% have to pick a regime 
ct=rise_time_series('2010q1',zeros(12,1),'RN3M_NW');
lb=rise_time_series('2010q1',-0.001*ones(12,1),'RN3M_NW');
ub=rise_time_series('2010q1',0.001*ones(12,1),'RN3M_NW');
[cond_fkst_db,cond_fkst_mean_db,uncond_fkst_db]=forecast(TwoChain,'forecast_paths',10,...
    'forecast_param_uncert',false,...
    'forecast_conditional_info',...
    struct('central_tendency',ct,'lower_bound',lb,'upper_bound',ub),...
    'forecast_regime',3);
%% lower bound only
% conditioning information and markov switching not fully ready yet so you
% have to pick a regime 
lb=rise_time_series('2010q1',-0.001*ones(12,1),'RN3M_NW');
[cond_fkst_db,cond_fkst_mean_db,uncond_fkst_db]=forecast(TwoChain,'forecast_paths',10,...
    'forecast_param_uncert',false,...
    'forecast_conditional_info',struct('lower_bound',lb),...
    'forecast_regime',3);
%% upper bound only
% conditioning information and markov switching not fully ready yet so you
% have to pick a regime 
ub=rise_time_series('2010q1',0.001*ones(12,1),'RN3M_NW');
[cond_fkst_db,cond_fkst_mean_db,uncond_fkst_db]=forecast(TwoChain,'forecast_paths',10,...
    'forecast_param_uncert',false,...
    'forecast_conditional_info',struct('upper_bound',ub),...
    'forecast_regime',3);
%% lower bound and upper bound only
% conditioning information and markov switching not fully ready yet so you
% have to pick a regime 
lb=rise_time_series('2010q1',-0.001*ones(12,1),'RN3M_NW');
ub=rise_time_series('2010q1',0.001*ones(12,1),'RN3M_NW');
[cond_fkst_db,cond_fkst_mean_db,uncond_fkst_db]=forecast(TwoChain,'forecast_paths',10,...
    'forecast_param_uncert',false,...
    'forecast_conditional_info',...
    struct('lower_bound',lb,'upper_bound',ub),...
    'forecast_regime',3);
%% lower bound and central tendency only
% conditioning information and markov switching not fully ready yet so you
% have to pick a regime 
ct=rise_time_series('2010q1',zeros(12,1),'RN3M_NW');
lb=rise_time_series('2010q1',-0.001*ones(12,1),'RN3M_NW');
[cond_fkst_db,cond_fkst_mean_db,uncond_fkst_db]=forecast(TwoChain,'forecast_paths',10,...
    'forecast_param_uncert',false,...
    'forecast_conditional_info',...
    struct('central_tendency',ct,'lower_bound',lb),...
    'forecast_regime',3);
%% upper bound and central tendency only
% conditioning information and markov switching not fully ready yet so you
% have to pick a regime 
ct=rise_time_series('2010q1',zeros(12,1),'RN3M_NW');
ub=rise_time_series('2010q1',0.001*ones(12,1),'RN3M_NW');
[cond_fkst_db,cond_fkst_mean_db,uncond_fkst_db]=forecast(TwoChain,'forecast_paths',10,...
    'forecast_param_uncert',false,...
    'forecast_conditional_info',...
    struct('central_tendency',ct,'upper_bound',ub),...
    'forecast_regime',3);

%% conditioning on both exogenous and endogenous variables
