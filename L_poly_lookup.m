function mat = L_poly_lookup(p, x)
% Use pre-defined coefficients for the Laguerre polynomials, taken from Wikipedia
% article -- see
% https://en.wikipedia.org/wiki/Laguerre_polynomials#The_first_few_polynomials and figure
% https://commons.wikimedia.org/wiki/File:Laguerre_poly.svg with gnuplot code

arguments
    p (1,1) double {mustBeInteger, mustBeNonnegative, mustBeFinite, mustBeReal, mustBeLessThanOrEqual(p, 5)} = 5;
    x (:,1) double {mustBeFinite, mustBeReal} = linspace(-2, 10, 1024);
end
fullmat = zeros(length(x), 6);
fullmat(:,1) = 1;                                                                 % P = 0
fullmat(:,2) = -x+1;                                                              % P = 1
fullmat(:,3) = (x.^2 - 4*x + 2)/2;                                                % P = 2
fullmat(:,4) = (-x.^3 + 9.*x.^2 - 18*x + 6)/6;                                    % P = 3
fullmat(:,5) = (x.^4 - 16*x.^3 + 72*x.^2 - 96.*x + 24)/24;                        % P = 4
fullmat(:,6) = (-x.^5 + 25.*x.^4 - 200.*x.^3 + 600.*x.^2 - 600.*x + 120)/120;     % P = 5

mat = fullmat(:,p+1);

end