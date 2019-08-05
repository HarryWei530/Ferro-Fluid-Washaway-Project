result = zeros(90,1);
count = 0;
increment = 4;
i = 1;
[resultsize ~] = size(result);

while i <= resultsize
    result(i) = count;
    result(i+1) = count;
    result(i+2) = count;
    count = count + increment; 
    i = i+3;
end

disp(result);
