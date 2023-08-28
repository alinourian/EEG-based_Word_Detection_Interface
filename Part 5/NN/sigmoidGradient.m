function gPrime = sigmoidGradient(x,b)
    if nargin < 2
        b = 1;
    end
    g = sigmoid(x,b);
    gPrime = b .* g .* (1 - g);
end