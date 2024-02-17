function s = fib(n)

    % COMMENTS BELOW SHOW TYPICAL STEPS YOU MIGHT TAKE IN YOUR SOLUTION

    % 1. Initialize correct size return variable vector for speed
    
    % 2. First element initialization
        
    % 3. Second element initialization
    
    % 4. Fill in the remaining elements
    if n==0
        s = 1:0;
        
    elseif n==1
        s(n)=0;
    else
    
        s = zeros(1,n);
       
        s(2) = 1;
        
        for i=3:n
            s(i) = s(i-1) + s (i-2);
        end
    end
end
