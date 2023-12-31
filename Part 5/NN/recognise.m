function answer = recognise(X, Theta1, Theta2)

m = size(X, 1);

h1 = sigmoid([ones(m, 1) X] * Theta1');
h2 = sigmoid([ones(m, 1) h1] * Theta2');

[~, answer] = max(h2, [], 2);

end