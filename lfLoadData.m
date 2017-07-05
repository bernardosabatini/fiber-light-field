function [ output_args ] = lfLoadData( startN, stopN )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

	for counter=startN:stopN
		
		ff=['AD0_' num2str(counter)];
		evalin('base', 'load(''' ff '''.mat');
	end
	

end

