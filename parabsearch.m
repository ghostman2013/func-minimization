function [x, y, n, cx, cy] = parabsearch(f, a, b, e)
    [res, x1, f1, x2, f2, x3, f3, a, b] = find(f, a, b, e);
    if res
        x = x2;
        y = f2;
        n = 0;
        cx = x2;
        cy = f2;
        return;
    end
    [x_avr, f_avr] = calc(f, x1, f1, x2, f2, x3, f3);
    n = 1;
    cx = [x1, x2, x3, x_avr];
    cy = [f1, f2, f3, f_avr];
    flag = true;
    while flag
        x_avr2 = x_avr;
        if x_avr > x2
            xl = x2;
            fl = f2;
            xr = x_avr;
            fr = f_avr;
        else
            xr = x2;
            fr = f2;
            xl = x_avr;
            fl = f_avr;
        end
        [~, x1, f1, x2, f2, x3, f3, a, b] = find2(f, a, xl, fl, xr, fr, b, e);
        [x_avr, f_avr] = calc(f, x1, f1, x2, f2, x3, f3);
        flag = abs(x_avr - x_avr2) > e;
        n = n + 1;
        cx = [cx, x1, x2, x3, x_avr];
        cy = [cy, f1, f2, f3, f_avr];
    end
    x = x_avr;
    y = f_avr;
end

function [x_avr, f_avr] = calc(f, x1, f1, x2, f2, x3, f3)
    a1 = (f2 - f1) / (x2 - x1);
    a2 = ((f3 - f1) / (x3 - x1) - a1) / (x3 - x2);
    x_avr = 0.5 * (x1 + x2 - a1 / a2);
    f_avr = f(x_avr);
end

function r = cond_stop(f1, f2, f3)
    r = (f1 >= f2 && f2 < f3) || (f1 > f2 && f2 <= f3);
end

function [r, x1, f1, x2, f2, x3, f3] = check(f, a, x1, f1, x2, f2, x3, f3, b)
    fa = f(a);
    fb = f(b);
    if cond_stop(fa, f1, f2)
        x3 = x2;
        f3 = f2;
        x2 = x1;
        f2 = f1;
        x1 = a;
        f1 = fa;
        r = true;
        return;
    else
        if cond_stop(f1, f2, fb)
            x3 = b;
            f3 = fb;
            r = true;
            return;
        end
    end
    r = false;
end

function [res, x1, f1, x2, f2, x3, f3, a, b] = find(f, a, b, e)
    res = false;
    t = (sqrt(5) - 1) / 2;
    len = b - a;
    x1 = b - t * len;
    x2 = a + t * len;
    f1 = f(x1);
    f2 = f(x2);
    x3 = 0;
    f3 = 0;
    while len > 2 * e
        [r, x1, f1, x2, f2, x3, f3] = check(f, a, x1, f1, x2, f2, x3, f3, b);
        if r
            return;
        end
        if f1 <= f2
            b = x2;
            len = b - a;
            x2 = x1;
            f2 = f1;
            x1 = b - t * len;
            f1 = f(x1);
        else
            a = x1;
            len = b - a;
            x1 = x2;
            f1 = f2;
            x2 = a + t * len;
            f2 = f(x2);
        end
    end
    [r, x1, f1, x2, f2, x3, f3] = check(f, a, x1, f1, x2, f2, x3, f3, b);
    if r
        return;
    end
    x3 = x2;
    f3 = f2;
    x2 = (x3 + x1) / 2;
    f2 = f(x2);
    res = true;
end

function [res, x1, f1, x2, f2, x3, f3, a, b] = find2(f, a, x1, f1, x2, f2, b, e)
    res = false;
    t = (sqrt(5) - 1) / 2;
    len = b - a;
    x3 = 0;
    f3 = 0;
    while len > 2 * e
        [r, x1, f1, x2, f2, x3, f3] = check(f, a, x1, f1, x2, f2, x3, f3, b);
        if r
            return;
        end
        if f1 <= f2
            b = x2;
            len = b - a;
            x2 = x1;
            f2 = f1;
            x1 = b - t * len;
            f1 = f(x1);
        else
            a = x1;
            len = b - a;
            x1 = x2;
            f1 = f2;
            x2 = a + t * len;
            f2 = f(x2);
        end
    end
    [r, x1, f1, x2, f2, x3, f3] = check(f, a, x1, f1, x2, f2, x3, f3, b);
    if r
        return;
    end
    x3 = x2;
    f3 = f2;
    x2 = (x3 + x1) / 2;
    f2 = f(x2);
    res = true;
end