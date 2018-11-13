delete(gcp('nocreate'));

numWorkers = 1:4;
percentages = [.25 .5 .75 1];
numVertices = 3:7;
iterations = 30;

PermData = [];
DfsData = [];
for w = numWorkers
    parpool(w);
    
    pool = gcp('nocreate');
    
    pI = 0;
    %addAttachedFiles(pool, "ExecuteHamiltonianPerm.m")
    for p = percentages
        pI = pI + 1;
%         times = [];
%         for v = numVertices
%             ["perm", p, v]
%             t = TimeHamiltonianPerm(v, p, iterations, pool.NumWorkers);
%             times = [times t];
%         end
%         PermData(pI, w, :) = times;
        
        times = [];
        for v = numVertices
            ["dfs", p, v]
            t = TimeHamiltonianDFS(v, p, iterations, pool.NumWorkers);
            times = [times t];
        end
        DfsData(pI, w, :) = times;      
    end
    delete(pool);
end

% save('dataGeorge.mat', 'A');