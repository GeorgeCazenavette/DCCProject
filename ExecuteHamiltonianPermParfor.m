function ExecuteHamiltonianPermParfor( n, G, numWorkers )
%HAMILTONIANPERM Summary of this function goes here
%   Detailed explanation goes here
    permutations = perms(1:n);
    foundCycle = 0;
    parfor i = 1:size(permutations, 1)
        p = permutations(i,:);
        cycle = true;
        for j = 1:n-1
            if G(p(j),p(j+1)) == 0
                cycle = false;
                break
            end
        end
        if cycle == true
            foundCycle = p;
        end
        pause(0.001);
    end
end