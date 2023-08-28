function [train, test] = get_train_and_test(X)
    train_sIndex = 1;
    test_sIndex = 1;
    X_sIndex = 1;
    train = zeros(3000,400);
    test = zeros(2000,400);
    for ii = 1:10
        train(train_sIndex:train_sIndex+300-1,:) = X(X_sIndex:X_sIndex+300-1,:);
        X_sIndex = X_sIndex + 300;
        train_sIndex = train_sIndex + 300;
        test(test_sIndex:test_sIndex+200-1,:) = X(X_sIndex:X_sIndex+200-1,:);
        X_sIndex = X_sIndex + 200;
        test_sIndex = test_sIndex + 200;
    end
end