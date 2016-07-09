%Author: Sazia Mahfuz
function Predicted=RunModel(Data1,B,Data1MN,Data1SN,Bfreq,Bcat)

% Calculating probability for the numerical attributes
row=height(Data1);
DataN=table2array(Data1(:,1:4));
Data1P=zeros(row,2);
for k = 1:2 
for i =1:row
    funp=1;
for j = 1:4    
    funp=funp*Prob(DataN(i,j),Data1MN(k,j),Data1SN(k,j));
end
Data1P(i,k)=funp;
end
end


% Calculating probability for the categorical attributes
BPN=zeros(row,2);
colB=width(B);
col=colB-1;
B=table2cell(B);
B=cellfun(@char,B,'UniformOutput',false);
Bcat=cellfun(@char,Bcat,'UniformOutput',false);
T=cell2mat(Bfreq(:,end));
for i =1:row
    for k=1:2
    funp=(T(k))/row;
    loc=0;
for j = 1:col
    temp=B(i,j);
    loc=index(temp,Bcat{1,j});
    funp=funp*Bfreq{k,j}(loc,2);
    end
BPN(i,k)=funp;
end
end

% Calculating the total probability for each instance in the dataset
DataP=Data1P.*BPN;

% Calculating the predicted class value
Predicted=cell(row,1);
for i=1:row
    Hp=-1;
    Hc=0;
    for j=1:2
        if Hp<DataP(i,j)
            Hp=DataP(i,j);
            Hc=j;
        end
    end
    if Hc==1
        Predicted{i,1}='<=50K';
    elseif Hc==2
        Predicted{i,1}='>50K';
    end
end

