function [Q_locs,S_locs] = Q_and_S_detection(x,Fs,N)
    [~,~,~,~,~,~,r_locs]=R_detection(x,Fs,N);
    Q_locs=[];
    S_locs=[];
    r0=1;
    for r1 = r_locs 
        d=(r0+r1)/2;
        d=ceil(d);
        [~,loc] = min(x(d:r1));
        Q_locs= [Q_locs d+loc-1];
        d=d+loc;

        [~,loc] = min(x(r1:r1+20));

        S_locs= [S_locs loc+r1];
        r0 =  r1 ;   
    end

end
