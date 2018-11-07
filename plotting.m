percentages = [.25,.5,.75,1];
vertices = [3:7];
workers = [1:4];
for i = 1:length(percentages)
    p = percentages(i);
    figure;
    hold on;
    title(sprintf("%d%% of Edges Drawn", 100*p));
    xlabel("Number of Vertices");
    ylabel("Average Time 30 Runs");
    for w = workers
        plot(vertices, squeeze(A(i,w,:)))
    end
    legend(workers + " workers");
    xticks(vertices);
    saveas(gcf, sprintf("%d_edges_%d_vertices.png", p*100, vertices(end)));
end