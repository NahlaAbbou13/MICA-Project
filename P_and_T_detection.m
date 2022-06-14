function [f_1, f_2, T_locs] = P_and_T_detection(x,Fs,N)
[~,~,~,~,~,~,R_locs]=R_detection(x,Fs,N);

%% Differentiator
b1 = [1,zeros(1,5),-1];
a1 = [1, 0 ];

f1 = dfilt.df2(b1,a1);
f_1 = filter(f1,x);
%f_1 = f_1(7:length(f_1));

%% Low pass filtering
b2 = [1,zeros(1,7),-1];
a2 = [1,-1];

f2 = dfilt.df2(b2,a2);
f_2 = filter(f2,f_1);
%f_2 = f_2(7:length(f_2));


%% T detection 

R_T = zeros(1, length(R_locs)-1);
for i = 1:length(R_locs)-1
    R_R = R_locs(i+1) - R_locs(i);
    R_T(i) = R_R * 0.7 + R_locs(i);
end
T_locs =  zeros(1, length(R_locs)-1);
for j = 1 : length(R_locs)-1
    for k = R_locs(j):R_T(j)
        if f_2(k)>0 && f_2(k+2)<0
               T_locs(j) = k+1;
            break;
        end
    end
end
T_locs = T_locs + 48;








