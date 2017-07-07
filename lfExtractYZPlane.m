function [ vals ] = lfExtractYZPlane(dataMatrix, xyz, Y, sZ, dZ)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
	if nargin<4
		sZ=-50;		
	end

	if nargin<5
		dZ=1;
	end
	
	Yind=find(xyz(2,:)==Y);
	minx=min(xyz(1,Yind));
	maxx=max(xyz(1,Yind));
	nx=(maxx-minx)/10+1;
	
	Z=(sZ:dZ:(80-dZ));
	nz=length(Z);
	
	vals=nan(nz, nx);
	for Yi=Yind
		x=xyz(1, Yi);
		for zc=Z
			z0=lfZtoPt(zc);
			z1=lfZtoPt(zc+dZ-.0001);
			vals(1+(zc-sZ)/dZ, 1+(x-minx)/10)=mean(dataMatrix(z0:z1,Yi));
		end
		
	end
	

end

