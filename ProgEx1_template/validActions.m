function [actions] = validActions(T,nodeIx)
	actions = {'Right','Down','Left','Up'};
	invalidActions = {};

	height = size(T,1);
	width  = size(T,2);
	[x,y] = fromNodeIx(T,nodeIx);

	fprintf('x=%u,y=%u,height=%u,width=%u\n',x,y,height,width);

	if x == 2
		% remove 'Left'
		invalidActions{end+1} = 'Left';
	end

	if x == height - 1
		% remove 'Right'
		fprintf('hhey!');
		invalidActions{end+1} = 'Down';
	end

	if y == 2
		% remove 'Up'
		invalidActions{end+1} = 'Up';
	end

	if y == width - 1	
		invalidActions{end+1} = 'Right';
	end
	invalidActions
end
