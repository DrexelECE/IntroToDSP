function X = my_dft(x)
N = length(x);
X = zeros(1,N); %added because this is an easy and obvious performance kick. 
for k=1:N
    % X(k) = 0; % redundant with 'zeros' call above. 
    for n=1:N
        X(k) = X(k)+x(n)*exp(-2j*pi*(k-1)/N*(n-1));
    end
end
end

