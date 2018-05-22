function run(name, meth, f, a, b, has_plot, has_trace)
    i = 1;
    fprintf("%s\n", name);
    printline('-');
    fprintf("| #\t| eps\t\t| N\t| x*\t\t| f*\t\t|\n");
    printline('-');
    if nargin < 6
        has_plot = true;
    end
    if nargin < 7
        has_trace = true;
    end
    for e = 0.1e-6%[0.1, 0.001, 0.00001]
        [x, y, n, cx, cy] = meth(f, a, b, e);
        fprintf("| %i\t| %i\t| %i\t| %.10f\t| %.10f\t|\n", i, e, n, x, y);
        if has_plot
            xs = a:e:b;
            ys = arrayfun(@func, xs);
            plotname = strcat(name, " for e=", num2str(e));
            if has_trace
                lab_plot(plotname, xs, ys, x, y, cx, cy);
            else
                lab_plot(plotname, xs, ys, x, y);
            end
        end
        i = i + 1;
    end
    printline('-');
end

function printline(ch, count)
    if nargin < 2
        count = 65;
    end
    for x = 1:1:count
        fprintf(ch);
    end
    fprintf("\n");
end