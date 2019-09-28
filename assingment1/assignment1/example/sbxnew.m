function [z1, z2] = sbxnew(g1, g2, x_min, x_max)
    
    par1 = g1;
    par2 = g2;
    yl = x_min;
    yu = x_max;
    mu = 1;
    % chech whether variable is selected or not
    if par2 > par1
        y2 = par2;
        y1 = par1;
    else
        y2 = par1;
        y1 = par2;
    end
    urnd = rand();
    if urnd<=0.5
        betaq=power(2*urnd,1/(mu+1));
    else
        betaq=power(1/(2*(1-urnd)),1/(mu+1));
    end
    chld1 = 0.5*((y1+y2)-betaq*(y2-y1));
    chld2 = 0.5*((y1+y2)+betaq*(y2-y1));
    if chld1 < yl
        chld1 = yl;
    end
    if chld1 > yu
        chld1 = yu;
    end
    if chld2 < yl
        chld2 = yl;
    end
    if chld2 > yu
        chld2 = yu;
    end

    z1 = chld1;
    z2 = chld2; 

end