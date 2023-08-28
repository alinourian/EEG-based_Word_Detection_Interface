function g = sigmoid(x,b)
    if nargin < 2
        b = 1;
    end
    g = 1./(1 + exp(-b.*x));
end