function [a] = artrial_fibrillation(r_locs)
    a = zeros(1,200);
    for i = 1:200
        a(i) = auto_covar(r_locs);
    end
end

function [S] = auto_covar(r_locs)
    l = [];
    for i = 1:(length(r_locs)-1)
        l = [l,r_locs(i+1)-r_locs(i)];
    end
    N = length(l);
    S = 0;
    delta_moy = mean(l);
    for n = 1:N-i
        S = S + (l(n+i)-delta_moy)*(l(n)-delta_moy);
    end
    S = S/(N-i-1);
end



