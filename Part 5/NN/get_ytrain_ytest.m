function [y_train, y_test] = get_ytrain_ytest(y)
    y_train_sIndex = 1;
    y_test_sIndex = 1;
    y_sIndex = 1;
    y_train = zeros(3000,1);
    y_test = zeros(2000,1);
    for ii = 1:10
        y_train(y_train_sIndex:y_train_sIndex+300-1) = y(y_sIndex:y_sIndex+300-1);
        y_sIndex = y_sIndex + 300;
        y_train_sIndex = y_train_sIndex + 300;
        y_test(y_test_sIndex:y_test_sIndex+200-1) = y(y_sIndex:y_sIndex+200-1);
        y_sIndex = y_sIndex + 200;
        y_test_sIndex = y_test_sIndex + 200;
    end
end