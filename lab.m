a = -1;
b = 0;
run("Bitwise search", @bitsearch, @func, a, b, false);
%run("Gold-section search", @goldsec, @func, a, b, false);
%run("Method of parabolas", @parabsearch, @func, a, b, false);
run("Newton's method", @newton, @func, a, b, false);