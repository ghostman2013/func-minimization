%% Returns a minimal point of the function
function [x, y, n, cx, cy] = goldsec(f, a, b, e)
    t = (sqrt(5) - 1) / 2;
    len = b - a;
    x1 = b - t * len;
    x2 = a + t * len;
    f1 = f(x1);
    f2 = f(x2);
    cx = [x1, x2];
    cy = [f1, f2];
    n = 3; % +1 for the result
    while len > 2 * e
        if f1 <= f2
            b = x2;
            len = b - a;
            x2 = x1;
            f2 = f1;
            x1 = b - t * len;
            f1 = f(x1);
            cx(end + 1) = x1;
            cy(end + 1) = f1;
        else
            a = x1;
            len = b - a;
            x1 = x2;
            f1 = f2;
            x2 = a + t * len;
            f2 = f(x2);
            cx(end + 1) = x1;
            cy(end + 1) = f1;
        end
        n = n + 1;
    end
    x = (a + b) / 2;
    y = f(x);
    cx(end + 1) = x;
    cy(end + 1) = y;
end