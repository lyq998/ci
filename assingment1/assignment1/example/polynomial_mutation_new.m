function z = polynomial_mutation_new(g, x_min, x_max)
    y = g;
    yl = x_min;
    yu = x_max;
    mum = 10;
    delta1 = (y-yl)/(yu-yl);
    delta2 = (yu-y)/(yu-yl);
    rnd = rand();
    if rnd <= 0.5
        val = 2*rnd+(1-2*rnd)*power((1-delta1),mum+1);
        deltaq = power(val,(1/(mum+1)))-1;
    else
        val = 2*(1-rnd)+(2*rnd-1)*power((1-delta2),mum+1);
        deltaq = 1-power(val,(1/(mum+1)));
    end
    y = y+deltaq*(yu-yl);
    if y < yl
        y = yl;
    end
    if y > yu
        y = yu;
    end
    z = y; 
end
