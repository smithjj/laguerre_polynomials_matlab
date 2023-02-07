function mat = L_poly_ours(p, x)
% Our Laguerre polynomial calculator, as used in lg_calc

if p == 0
    mat = ones(size(x));
elseif p == 1
    mat = zeros(2, length(x));
    mat(1,:) = 1;
    mat(2,:) = -x + 1;
else
    mat = zeros(p+1, length(x));
    mat(1,:) = 1;                   % p=0
    mat(2,:) = -x + 1;              % p=1

    for n = 3:(p+1)
        mat(n,:) = (2*n-3)./(n-1).*mat(n-1,:) - x./(n-1).*mat(n-1,:) - (n-2)./(n-1).*mat(n-2,:);
    end
end
mat = mat(end,:);
end