close all
percentages = [.25,.5,.75];
patterns = ["or-", "dg--", "*b:", "xm-."];
vertices = [3:7];
workers = [1:4];
for i = 1:length(percentages)
    p = percentages(i);
  
    figure;
    hold on;
    title(sprintf("Permutation: %d%% of Edges Drawn", 100*p));
    xlabel("Number of Vertices");
    ylabel("Average Time 30 Runs");
    for j = 1:length(workers)
        w = workers(j);
        plot(vertices, squeeze(PermData(i,w,:)), patterns(j))
    end
    legend(workers + " workers");
    xticks(vertices);
    saveas(gcf, sprintf("perm_%d_edges_%d_vertices.png", p*100, vertices(end)));
    
    figure;
    hold on;
    title(sprintf("BFS: %d%% of Edges Drawn", 100*p));
    xlabel("Number of Vertices");
    ylabel("Average Time 30 Runs");
    for j = 1:length(workers)
        w = workers(j);
        plot(vertices, squeeze(DfsData(i,w,:)), patterns(j))
    end
    legend(workers + " workers");
    xticks(vertices);
    saveas(gcf, sprintf("dfs_%d_edges_%d_vertices.png", p*100, vertices(end)));
end