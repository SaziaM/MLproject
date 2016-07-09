function [B,Data1]=DataPrep(Data)
% Attribute names to be used for the categorical attributes
R={'workclass','marital_status','native_country','relationship','race',...
    'sex','education','occupation','income'};

A=R;



% Creating the table for the categorical attributes
B=varfun(@categorical,Data,'InputVariables',A);
B.Properties.VariableNames=A;
colB=width(B);

% Creating the table for the numerical attributes
Data1=[Data(:,~ismember(Data.Properties.VariableNames,R)) B(:,colB)];
c={'age','fnlwgt','education_num','capital_gain','hours_per_week','income'};
Data1=Data1(:,c);
