function mat = L_poly_wiki(p, x)
% My best interpretation of the recursion relations that are found in Wikipedia's article at
% https://en.wikipedia.org/wiki/Laguerre_polynomials#Recursive_definition,_closed_form,_and_generating_function

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
        % Because k starts counting at 0, and MATLAB starts indexing at 1, and n is the
        % 1st index of mat:
        k = n - 1; 
        mat(k+1,:) = ((2*k + 1 - x).*mat(k,:) - k*mat(k-1,:) )./ (k+1);
    end
end
mat = mat(end,:);
end