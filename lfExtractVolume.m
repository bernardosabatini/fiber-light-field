function [ vals ] = lfExtractVolume(dataMatrix, xyz,  dZ)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
	if nargin<3
		dZ=1;
	end
	
	
	xVal=sort(unique(xyz(1,:)));
	yVal=sort(unique(xyz(2,:)));
	
	minX=min(xVal);
	maxX=max(xVal);
	dX=xVal(2)-xVal(1);
	nX=(maxX-minX)/dX+1;
	
	minY=min(yVal);
	maxY=max(yVal);
	dY=yVal(2)-yVal(1);
	nY=(maxY-minY)/dY+1;

	zVal=-50:dZ:80;
	nZ=length(zVal);
	minZ=-50;
	
	vals=nan(nX, nY, nZ);	
	
	for counter=1:size(dataMatrix,2)
		xInd=(xyz(1, counter)-minX)/dX+1;
		yInd=(xyz(2, counter)-minY)/dY+1;
		
		if counter/1000==floor(counter/1000)
			disp(num2str(counter))
		end
		
		if ~isnan(xInd) & ~isnan(yInd)
			if isnan(vals(xInd, yInd, 1))
				for zInd=1:nZ
					zc=zVal(zInd);
					z0=lfZtoPt(zc);
					z1=lfZtoPt(zc+dZ-.0001);
					vals(xInd, yInd, zInd)= ... 
						mean(dataMatrix(z0:z1,counter));
				end
			end
		end
	end
	

end

