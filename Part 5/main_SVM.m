%% ======================= Load and Preproccessing ========================
clear; clc;
% fpass = [0.5 38];
Fs_new = 128;
% bpf = load('BPF.mat');
% bpf = bpf.BPF.Numerator;
bpf = load('BPfilter');
bpf = bpf.Num;
Subject1 = preproccessing2('SubjectData2.mat',bpf,Fs_new);
% Subject2 = preproccessing('SubjectData1.mat',fpass,Fs_new);
% Subject3 = preproccessing('SubjectData3.mat',fpass,Fs_new);
% Subject4 = preproccessing('SubjectData4.mat',fpass,Fs_new);
% Subject5 = preproccessing('SubjectData5.mat',fpass,Fs_new);
% Subject6 = preproccessing('SubjectData6.mat',fpass,Fs_new);
% Subject7 = preproccessing('SubjectData7.mat',fpass,Fs_new);
% Subject8 = preproccessing('SubjectData8.mat',fpass,Fs_new);


%% =============================== Feature ================================
Subject = Subject1;
mode = 3;
if mode == 1
    Subject_features = getFeature(Subject1,0);     % Feature-1
elseif mode == 2
    Subject_features = getFeature2(Subject,0);     % Feature-2
else
    Subject_features = getFeature3(Subject,0,1);     % Feature-3
end
%% =============================== Learning ===============================
% ----- it takes time up to 10min for feature1 and 20' for feature2. ------
% -------- The resault has saved with the name of 'SVMModel1.mat' ---------
mode = 1;
n = size(Subject_features.feature,1);
[Model,X_train,y_train] = learn(Subject_features,n,mode);

%% ============================ Check Learning ============================
clc;
ypred = predict(Model,X_train);

precision = mean(double(ypred == y_train)) * 100;
fprintf('Correct recognition: %.2f%%\n\n', precision);

% output of algorithm on test
X_test = Subject_features.test_feature;
ypred_test = predict(Model,X_test);

i = ypred_test == 1;
num = Subject.test_lcd_values(i);

mode = 1;
%word = getword(num,5,mode);
LCD = ['A','B','C','D','E','F';...
    'G','H','I','G','K','L';...
    'M','N','O','P','Q','R';...
    'S','T','U','V','W','X';...
    'Y','Z','0','1','2','3';...
    '4','5','6','7','8','9']';
Result = LCD(num)
disp(length(Result));
%% ================================= END ==================================