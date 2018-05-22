%% Returns a minimal point of the function
function [x, y, n, cx, cy] = newton(f, a, b, e)
    x = (a + b) / 2;
    n = 1;
    cx = [];
    cy = [];
    while true
        %[f1, cx, cy] = func1(f, x, e, cx, cy);
        f1 = func(x);
        n = n + 1;
        [f2, cx, cy] = func1(f, x, e, cx, cy);
        x2 = x - f1 / f2;
        if x2 >= b
            x = b;
            break;
        end
        if x2 <= a
            x = a;
            break;
        end
        n = n + 1;
        if abs(x2 - x) <= e
            break;
        end
        x = x2;
    end
    y = f(x);
    cx(end + 1) = x;
    cy(end + 1) = y;
end

function [f, cx, cy] = func1(func, x, e, cx, cy)
    fxe = func(x + e);
    fx = func(x);
    cx = [cx, x + e, x];
    cy = [cy, fxe, fx];
    f = (fxe - fx) / e;
end

function [f, cx, cy] = func2(func, x, e, cx, cy)
    x3m = x - 3 * e;
    x2m = x - 2 * e;
    x1m = x - e;
    x1 = x + e;
    x2 = x + 2 * e;
    x3 = x + 3 * e;
    f3m = 1 / 90 * func(x3m);
    f2m = -3 / 20 * func(x2m);
    f1m = 3 / 2 * func(x1m);
    f0 = -49 / 18 * func(x);
    f1 = 3 / 2 * func(x1);
    f2 = -3 / 20 * func(x2);
    f3 = 1 / 90 * func(x3);
    cx = [cx, x3m, x2m, x1m, x, x1, x2, x3];
    cy = [cy, f3m, f2m, f1m, f0, f1, f2, f3];
    f = (f3m + f2m + f1m + f0 + f1 + f2 + f3) / (e * e);
end