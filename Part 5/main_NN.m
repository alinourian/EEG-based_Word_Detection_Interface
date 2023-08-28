%% ======================= Load and Preproccessing ========================
clear; clc;
fpass = [0.5 30];
Fs_new = 128;
bpf = load('BPfilter');
bpf = bpf.Num;
Subject1 = preproccessing2('SubjectData2.mat',bpf,Fs_new);
Subject2 = preproccessing('SubjectData2.mat',fpass,Fs_new);
Subject3 = preproccessing('SubjectData3.mat',fpass,Fs_new);
Subject4 = preproccessing('SubjectData4.mat',fpass,Fs_new);
Subject5 = preproccessing('SubjectData5.mat',fpass,Fs_new);
Subject6 = preproccessing('SubjectData6.mat',fpass,Fs_new);
Subject7 = preproccessing('SubjectData7.mat',fpass,Fs_new);
Subject8 = preproccessing('SubjectData8.mat',fpass,Fs_new);

Subject = Subject1;
Subject_features = getFeature3(Subject,0,5);

train = Subject_features.feature;
y_train = Subject_features.label; i = find(y_train == 0); y_train(i) = 2;
test = Subject_features.test_feature;
test_value = Subject.test_lcd_values;
%% ============================ Neural Network ============================

input_layer_size  = 1024;
hidden_layer_size = 256;
num_labels = 2;

[Theta1, Theta2, train_pred, test_pred, Resault] = ...
    NeuralNetworkLearnig(train,y_train,test,test_value,...
    input_layer_size,hidden_layer_size,num_labels,150);
disp(Resault);
disp(length(Resault));
% =============================== The End =============================== %
% ======================================================================= %