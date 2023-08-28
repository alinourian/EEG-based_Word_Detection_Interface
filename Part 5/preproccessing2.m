function new_Subject = preproccessing2(subjectName,bpf,Fs_new)
    Subject = load(subjectName);
    Subject = bandpassStruct2(Subject,bpf);            % bandpass-filtering
    Subject = reduceSampleRateStruct(Subject,Fs_new);	% down-sampling
    Subject = IndexExtraction(Subject);                 % index-extractioning
    new_Subject = epochStruct(Subject);                 % epoching
end