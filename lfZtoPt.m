function [ pt ] = lfZtoPt(Z)
%lfZtoPt Pass if a Z-plane in micros (-50 to 80) and get back the index
%   Detailed explanation goes here

	pt=round((Z+50)*7000/130)+2000;

end

