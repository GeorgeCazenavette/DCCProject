function ExecuteHamiltonianPermParfor( n, G, numWorkers )
%HAMILTONIANDFS Summary of this function goes here
%   Detailed explanation goes here
    parfor i = 1:n
        doBFS(i,G,n);
    end
end

function doBFS(starting_node, G, n)
    BFS(starting_node, G, n);
end

function BFS(cur_path, G, n)
    cur_node = cur_path(end);
    if cur_node == n && size(cur_path,2) == n
        %disp(cur_path)
    else
        pause(0.001);
        for i = 1:n
            if G(cur_node,i) && ~ismember(i,cur_path)
                BFS([cur_path,i], G, n);
            end
        end
    end
end