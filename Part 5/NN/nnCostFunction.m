function [J, grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
                               
% Reshape nn_params back into the parameters Theta1 and Theta2
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Feedforward the neural network and calculate the cost function
m = size(X, 1);
a1 = [ones(m,1) X];
z2 = a1 * Theta1';              % (Theta1 * a1')';
a2 = [ones(m,1) sigmoid(z2)];
z3 = a2 * Theta2';              % (Theta2 * a2')';
a3 = sigmoid(z3);
h = a3;

yOut = zeros(m, num_labels);
for ii=1:num_labels
  yOut(:,ii) = (y == ii);
end

cost = -yOut.*log(h) - (1-yOut).*log(1 - h);
J = (1/m) * sum(sum(cost,2));
regularization = (lambda/(2*m)) * (sum(sum(Theta1(:,2:end).^2)) +...
                                        sum(sum(Theta2(:,2:end).^2)));
J = J + regularization;

% Backpropagation Algorithm
delta3 = a3 - yOut;
delta2 = delta3 * Theta2(:,2:end) .* sigmoidGradient(z2);

Delta1 = delta2' * a1;
Delta2 = delta3' * a2;

% Gradient for Theta1 and Theta2
Theta1_grad = Delta1/m + lambda/m*[zeros(hidden_layer_size , 1) Theta1(:,2:end)];
Theta2_grad = Delta2/m + lambda/m*[zeros(num_labels , 1) Theta2(:,2:end)];

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end