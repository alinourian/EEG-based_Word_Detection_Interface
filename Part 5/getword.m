function word = getword(num,len,mode)
    LCD = ['A','B','C','D','E','F';...
    'G','H','I','G','K','L';...
    'M','N','O','P','Q','R';...
    'S','T','U','V','W','X';...
    'Y','Z','0','1','2','3';...
    '4','5','6','7','8','9']';


    if mode == 1
        Result = LCD(num);
        
        l = length(Result);
        rate = floor(l / len);
        
        s = cell(1,len);
        for i=1:len-1
            s{i} = Result((i-1)*rate+1:i*rate);
        end
        s{len} = Result((len-1)*rate:end);
    else
        
    end
    
    for m=1:length(s)
        y = s{m};
        temp = unique(y);
        counter = zeros(1,length(temp));
        j = 1;
        for i=temp
            for k=1:length(y)
                if y(k) == i
                    counter(j) = counter(j) + 1;
                end
            end
            j = j + 1;
        end
        [~,iindex] = max(counter);
        Max(m) = temp(iindex);
        lasti = find(y == Max(m));
        if m ~= length(s)
            ll = length(y(lasti(end)+1:end));
            s{m+1} = [y(lasti(end)+1:end),s{m+1}(1:end-ll)];
        end
    end
    word = Max;
end