% Function for calculating the Probability using Gaussian distribution
function p=Prob(attribute,mean,sdev)
e=exp(-((attribute-mean).^2)/(2*sdev.^2));
p=(1/(sqrt(2*pi)*sdev))*e;