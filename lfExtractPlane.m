function [ vals ] = lfExtractPlane(dataMatrix, plane, width)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

	if nargin<3
		width=10;
	end
	
	lowInd=lfZtoPt(plane-width);
	hiInd=lfZtoPt(plane+width);

	n=size(dataMatrix,2);
	vals=mean(dataMatrix(lowInd:hiInd,:));
end

