function y = r(x)
    for n = 1: length(x)
        if (x(n) < 0)
            y(n) = 0;
        else
            y(n) = x(n);
        end
    end
end

