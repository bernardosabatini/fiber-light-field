function [ cellData ] = lfLoadData(inds)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

	pres={'AD0_', 'GF_', 'GD_', 'GU_', 'Z_'};
	
	cellData=cell(1,length(pres)+1);	
	nTrials=length(inds);
	xyz=nan(3, nTrials);
	
	cp=0;
	for pre=pres
		cp=cp+1;
		prefix=pre{1};
		dataLoad=nan(10000, nTrials);
		counter=0;
		for index=inds
			counter=counter+1;
			ff=[prefix num2str(index)];
			try
				aa=load([ff '.mat']);
				dataLoad(:, counter)=aa.(ff).data;
				if cp==1
					xyz(1, counter)=...
						lfHeaderValue(aa.(ff).UserData.headerString, ...
						'state.motor.relXPosition', 1);
					
					xyz(2, counter)=...
						lfHeaderValue(aa.(ff).UserData.headerString, ...
						'state.motor.relYPosition', 1);
					xyz(3, counter)=...
						lfHeaderValue(aa.(ff).UserData.headerString, ...
						'state.motor.relZPosition', 1);
				end
			catch
				disp(['error with ' ff ]);
			end
		end
		cellData{cp}=dataLoad;
	end
	cellData{end}=xyz;
	
end

