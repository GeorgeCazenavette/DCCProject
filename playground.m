%delete(gcp('nocreate'));
%parpool(2);
%pool = gcp('nocreate');

global n G stack;
n = 6;
p = 0.5;

G = rand(n,n) <= p;


G = [0 1 0 0 0 0;
     0 0 1 1 0 0;
     0 0 0 0 1 0;
     0 0 1 0 0 1;
     0 0 0 1 0 1;
     0 0 0 0 0 0];

stack = {};
for i = 1:n
    cur_path = [i];
    stack{end+1} = cur_path;
end

while size(stack) > 0
    cur_path = stack{end};
    stack(end) = [];
    BFS(cur_path);
end



function BFS(cur_path)
    global n G stack;
    cur_node = cur_path(end);
    if cur_node == n && size(cur_path,2) == n
        disp(cur_path)
    else
        for i = 1:n
            if G(cur_node,i) && ~ismember(i,cur_path)
                stack{end+1} = [cur_path,i];
            end
        end
    end
end
