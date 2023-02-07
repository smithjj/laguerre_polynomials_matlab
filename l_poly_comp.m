% A script using different definitions of Laguerre polynomial functions:

% Construct a vector of x values
Nx = 1024; 
x = linspace(-5, 20, Nx);

% We'll look at each p value between 0 and 5
pvec = 0:5;

% Pre-allocate arrays for storing results of calculations
L_lookup    = zeros(length(pvec), Nx);
L_ours      = zeros(length(pvec), Nx);
L_wiki      = zeros(length(pvec), Nx);

% Use each calculator for all p values between 0 and 5
for p = pvec
    L_lookup(p+1, :)    = L_poly_lookup(p, x);
    L_ours(p+1, :)      = L_poly_ours(p, x);
    L_wiki(p+1, :)      = L_poly_wiki(p, x);
end

% Plot results:

% find or re-use a figure with tag Lcomparison
fh = findobj('tag', 'Lcomparison');
if isempty(fh)
    fh = figure('tag', 'Lcomparison');
else
    clf(fh);
    figure(fh);
end
set(fh, 'outerposition', [5, 50, 1000, 1000]);
% Add 3 subplots to blank figure
ax1 = axes('parent', fh);
ax2 = axes('parent', fh);
ax3 = axes('parent', fh);
subplot(3,1,1,ax1);
subplot(3,1,2,ax2);
subplot(3,1,3,ax3);

% Plot each result

phs_ours        = plot(ax1, x, L_ours(1,:), ...
    x, L_ours(2,:), ...
    x, L_ours(3,:), ...
    x, L_ours(4,:), ...
    x, L_ours(5,:), ...
    x, L_ours(6,:));

phs_lookup      = plot(ax2, x, L_lookup(1,:), ...
    x, L_lookup(2,:), ...
    x, L_lookup(3,:), ...
    x, L_lookup(4,:), ...
    x, L_lookup(5,:), ...
    x, L_lookup(6,:));

phs_wiki      = plot(ax3, x, L_wiki(1,:), ...
    x, L_wiki(2,:), ...
    x, L_wiki(3,:), ...
    x, L_wiki(4,:), ...
    x, L_wiki(5,:), ...
    x, L_wiki(6,:));

% Set axis limits, labels, and legends
xlim(ax1, [-5, 20]);
xlim(ax2, [-5, 20]);
xlim(ax3, [-5, 20]);
ylim(ax1, [-10, 20]);
ylim(ax2, [-10, 20]);
ylim(ax3, [-10, 20]);

xlabel(ax1, 'x');
xlabel(ax2, 'x');
xlabel(ax3, 'x');
ylabel(ax1, 'L_n(x)');
ylabel(ax2, 'L_n(x)');
ylabel(ax3, 'L_n(x)');
title(ax1, {'Laguerre polynomials: ','Ours'}, 'fontweight', 'normal');
title(ax2, {'Laguerre polynomials: ','Lookup'}, 'fontweight', 'normal');
title(ax3, {'Laguerre polynomials: ','Wikipedia definition'}, 'fontweight', 'normal');

% Add xline and yline at y=0 and x=0 to compare with figure on wikipedia
hold(ax1, 'on');
hold(ax2, 'on');
hold(ax3, 'on');

xline(ax1, 0);
yline(ax1, 0);
xline(ax2, 0);
yline(ax2, 0);
xline(ax3, 0);
yline(ax3, 0);

legend(ax1, '0', '1', '2', '3', '4', '5');
legend(ax2, '0', '1', '2', '3', '4', '5');
legend(ax3, '0', '1', '2', '3', '4', '5');


return
% Plot ratios of Laguerre polynomials: ours / lookup and wikipedia / lookup
fh2 = figure;
ax21 = axes('parent', fh2);
ax22 = axes('parent', fh2);
subplot(2,1,1,ax21);
subplot(2,1,2,ax22);

phsrat = plot(ax21, x, L_ours(1,:) ./ L_lookup(1,:), ...
    x, L_ours(2,:) ./ L_lookup(2,:), ...
    x, L_ours(3,:) ./ L_lookup(3,:), ...
    x, L_ours(4,:) ./ L_lookup(4,:), ...
    x, L_ours(5,:) ./ L_lookup(5,:), ...
    x, L_ours(6,:) ./ L_lookup(6,:));

phsrat2 = plot(ax22, x, L_wiki(1,:) ./ L_lookup(1,:), ...
    x, L_wiki(2,:) ./ L_lookup(2,:), ...
    x, L_wiki(3,:) ./ L_lookup(3,:), ...
    x, L_wiki(4,:) ./ L_lookup(4,:), ...
    x, L_wiki(5,:) ./ L_lookup(5,:), ...
    x, L_wiki(6,:) ./ L_lookup(6,:));


