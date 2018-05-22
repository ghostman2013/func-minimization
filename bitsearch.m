%% Returns a minimal point of the function
function [x, y, n, cx, cy] = bitsearch(f, a, b, e)
    d = (b - a) / 4;
    x0 = a;
    f0 = f(x0);
    n = 1;
    cx = x0;
    cy = f0; 
    while true
        x1 = x0 + d;
        f1 = f(x1);
        n = n + 1;
        if f0 > f1
            x0 = x1;
            f0 = f1;
            cx(end + 1) = x0;
            cy(end + 1) = f0;
            if x0 > a && x0 < b
                continue;
            end
        end
        if abs(d) <= e
            break;
        end
        x0 = x1;
        f0 = f1;
        cx(end + 1) = x0;
        cy(end + 1) = f0;
        d = -d / 4;
    end
    x = x0;
    y = f0;
end