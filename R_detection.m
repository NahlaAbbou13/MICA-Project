function [lpf,bpf,pass_dif,s_sq,s_mwi_n,s_mwi_n2,R_locs] = R_detection(x,Fs,N)

%% Low pass filtering 
b1 = [1,zeros(1,5),-2,zeros(1,5),1];
a1 = [1,-2,1];

hlpf = dfilt.df2(b1,a1);
lpf = filter(hlpf,x);
lpf=lpf/max(abs(lpf));
lpf = lpf(6:length(lpf)); % retard de 5


%% High pass filtering 
b2 = [-1,zeros(1,15),32,-32,zeros(1,14),1];
a2 = [1,-1] ;
hbpf = dfilt.df2(b2,a2);
bpf = filter(hbpf,lpf);
bpf = bpf/max(abs(bpf));
bpf = bpf(16:length(bpf));


%% Differential filtering
b3=[1 2 0 -2 -1];
df = filter(b3, 8/Fs, [1 zeros(1,4)]);
pass_dif = conv(bpf, df);
pass_dif = pass_dif/max(abs(pass_dif));
pass_dif = pass_dif(3:length(pass_dif));
            
%% Squared signal 
s_sq = abs(pass_dif).^2 ;
s_sq = s_sq/max(abs(s_sq));
%% MWI

% Méthode 1
window = ones(1,N)/N; % porte de taille N et d'amplitude 1/N
s_mwi = conv(window,s_sq); 
M=max(abs(s_mwi));
s_mwi_n = s_mwi/M;

% Méthode 2
s_mwi_2 = [zeros(1,N) s_sq zeros(1,N) ];
A = zeros(1,length(s_sq));
for i=N:length(s_sq)-N+1
    A(i-N+1) = sum(s_mwi_2(i-N+1:i))/N;
end
s_mwi_n2=A/max(abs(A));

%% R_detection

th = mean(s_mwi_n) ;
Lm = length(s_mwi_n);
r_locs=[];
zon = s_mwi_n > th;
r=1;
while (r< Lm)
    
    if(zon(r) == 1)

        c = r;
        while and(zon(r) == 1,r< Lm )
            r=r+1;
        end
        [~,loc] = max(s_mwi_n(c:r));
        r_locs = [r_locs loc+c-1];
    else
        r=r+1;
    end
end

R_locs=r_locs(2:length(r_locs))-4;
