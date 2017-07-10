function [ vals ] = lfExtractXZPlane(dataMatrix, xyz, X, sZ, dZ)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
	if nargin<4
		sZ=-50;		
	end

	if nargin<5
		dZ=1;
	end
	
	Xind=find(xyz(1,:)==X);
	miny=min(xyz(2,Xind));
	maxy=max(xyz(2,Xind));
	ny=(maxy-miny)/10+1;
	
	Z=(sZ:dZ:(80-dZ));
	nz=length(Z);
	
	vals=nan(ny, nz);
	for Xi=Xind
		y=xyz(2, Xi);
		for zc=Z
			z0=lfZtoPt(zc);
			z1=lfZtoPt(zc+dZ-.0001);
			vals(1+(y-miny)/10, 1+(zc-sZ)/dZ)=mean(dataMatrix(z0:z1,Xi));
		end
		
	end
	

end

