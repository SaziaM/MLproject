%Author: Sazia Mahfuz
% Finding out the location of the category value ...
% which is equal to the instance attribute value
function loc=index(a,A)
loc=0;
[a loc]=ismember(a,A);
