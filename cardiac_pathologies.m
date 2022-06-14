function[a,b,c] = cardiac_pathologies(R_locs,epsilon,Ts)
    [a,b,deltas] = tachy_brady(R_locs,Ts) ;
    c = ectopic_beat(deltas,epsilon);
    
end

function[a,b,deltas]=tachy_brady(R_locs,Ts)
    l = [];
    a = "";
    b = "";
    for i = 1:(length(R_locs)-1)
        l = [l,R_locs(i+1)-R_locs(i)];
    end
    deltas = l ;
    deltas_moy = mean(deltas) ;
    if (60/(deltas_moy*Ts)) < 60
        disp( "---> Tachycardia detectée <---") ;
    end
    if 60/(deltas_moy*Ts) > 100
        disp("---> Bradycardia detectée <---") ;
    end
end


function [a] = ectopic_beat(delta,epsilon)
    a = "" ;
    for i = 1:(length(delta)-1)
        if abs(delta(i)-delta(i+1)) > epsilon
            disp("---> Ectopic beat detectée <---");
            break ;
        end
    end
end


