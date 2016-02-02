function x  = my_idft(X)
%my_idft is a manual implementation of the idft.

N = numel(X);
x = zeros(1, N);

for n=1:N
    % X(k) = 0; % redundant with 'zeros' call above. 
    for k=1:N
        x(n) = x(n) + X(k)*exp(2j*pi*(n-1)/N*(k-1));
    end
    x(n) = x(n)/N;

end
end

