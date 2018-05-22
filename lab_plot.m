%% Draws a plot of {x, y} with points {px, py} and filled points {xr, yr}
function lab_plot(name, x, y, xr, yr, px, py)
    figure
    plot(x,y);
    title(name)
    hold on
    if nargin == 7
        scatter(px, py);
    end
    scatter(xr, yr, "filled");
    hold off
end