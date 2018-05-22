function f = func(x)
%     sqrt5 = sqrt(5);
%     x5 = x.^5;
%     exp1 = cos((3*x5-10*x+(10.^(1/3))-2-10*sqrt(2)) / 10);
%     exp21 = 10*x5-10*sqrt5*(x.^4)+10*(x.^3)+3*(x.^2)-3*sqrt5*x + 1;
%     exp2 = atan(exp21 / (2*(x.^2)-2*sqrt5*x+2));
%     f = exp1 + exp2;
%     tmp = x + 0.234;
%     f = tmp * tmp * (1 - cos(0.1 * tmp)).^4;
    f = (x + 0.5).^2;
end