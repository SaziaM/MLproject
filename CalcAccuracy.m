% Calculating the accuracy for the predicted values 
function accuracy=CalcAccuracy(Actual,Predicted)
[nr nc]=size(Actual);
correct=0;
for i=1:nr
    if isequal(Actual(i,1),Predicted(i,1))
        correct=correct+1;
    end
end
accuracy=(correct/nr)*100;
