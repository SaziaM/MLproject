%Author: Sazia Mahfuz
%1: <=50K   2:>50K

%Preparing the train dataset
Data=readtable('income3_trn.csv');

%B holds the categorical attributes and Data1 holds the numerical attributes
[B,Data1]=DataPrep(Data);

%Training the model
[Data1MN,Data1SN,Bfreq,Bcat]=MakeModel(Data1,B);
Predicted=RunModel(Data1,B,Data1MN,Data1SN,Bfreq,Bcat);
colB=width(B);
%Actual classification for the training dataset
Actual=table2cell(B(:,colB));
Actual=cellfun(@char,Actual,'UniformOutput',false);
%Calculating the accuracy for the training dataset                                              
accuracy=CalcAccuracy(Actual,Predicted);
                                                                                           
%Run the test dataset
Test=readtable('income3_tst_nolabel.csv');
[BT,Data1T]=DataPrep(Test);
PredictedTest=RunModel(Data1T,BT,Data1MN,Data1SN,Bfreq,Bcat);
Result=cell2table(PredictedTest,'VariableNames',{'income'});

%Store the result in a csv file
%writetable(Result,'Result_NaiveBayes.csv');
ResultT=Test;
ResultT(:,15)=Result;
writetable(ResultT,'Result_NaiveBayes.csv');
