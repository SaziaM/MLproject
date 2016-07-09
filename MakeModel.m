function [Data1MN,Data1SN,Bfreq,Bcat]=MakeModel(Data1,B)

w=width(Data1);
w=w-1;
% Creating a table for holding the mean of the numerical attributes
Data1M=varfun(@mean,Data1,'InputVariables',...
    Data1.Properties.VariableNames(1:w),...
    'GroupingVariables','income');

% Creating a table for holding the standard deviation of the numerical attributes
Data1S=varfun(@std,Data1,'InputVariables',...
    Data1.Properties.VariableNames(1:w),...
    'GroupingVariables','income');

% Creating the vectors for mean and standard deviation
Data1MN=table2array(Data1M(:,3:w+2));
Data1SN=table2array(Data1S(:,3:w+2));


% Creating tables for the categorical attributes

Bfreq=varfun(@countcats,B,'GroupingVariables',...
'income','OutputFormat','cell');
Bcat=varfun(@categories,B,'OutputFormat','cell');
Bcount=varfun(@countcats,B,'InputVariables','income');
Bcount=table2cell(Bcount);
Bfreq=[Bfreq Bcount];
ncol=length(Bfreq);
Temp=cell2mat(Bfreq(:,end));
for k=1:2
for i=1:(ncol-1)
    n=length(Bfreq{k,i});
    for j=1:n
    Bfreq{k,i}(j,2)=(Bfreq{k,i}(j,1)+1)./(Temp(k)+1);
    end
end
end


