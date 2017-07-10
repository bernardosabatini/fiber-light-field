function [ sortVals, sortCounters ] = lfResort( vals, xyz, spacing )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

	if nargin<3
		spacing=10;
	end
	
	minx=min(xyz(1,:));
	miny=min(xyz(2,:));
	
	dx=1+(max(xyz(1,:))-minx)/spacing;
	dy=1+(max(xyz(2,:))-miny)/spacing;

	sortVals=nan(dx, dy);
	sortCounters=nan(dx, dy);
	
	for counter=1:length(vals)
		if ~isnan(xyz(1, counter)) 
			ix=(xyz(1, counter)-minx)/spacing+1;
			iy=(xyz(2, counter)-miny)/spacing+1;
			if isnan(sortCounters(ix,iy))
				sortCounters(ix,iy)=counter;
				sortVals(ix,iy)=vals(counter);
			end
		end
	end
	
end

