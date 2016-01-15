function y = u(x)
    for n = 1: length(x)
        if (x(n) < 0)
            y(n) = 0;
        else
            y(n) = 1;
        end
    end
end

