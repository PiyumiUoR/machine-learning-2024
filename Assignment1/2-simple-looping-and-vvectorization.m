% Load the file 'problem2.mat' using the load function without assigning its output to any variable. The workspace will then contain the vector 'v' of integers needed for this problem
load("problem2.mat");

% Write a for loop that computes the sum of the elements in v, and stores it to the variable 's'
s = 0;
for n = 1:length(v)
    s = s + v(n);
end

% Calculate the same sum using the 'sum' function instead of a loop, and store the result into 'ss'
ss=sum(v);

% Calculate the sum of squares of the elements in v using the 'sum' function and the element-wise power operator (.^) instead of a loop. Store the result into 'ss2'
ss2=sum(v.^2);

% Make another for loop that goes through the elements of v, and creates a same size vector called 'w' containing -1 for odd, and +1 even valued element indexes of v.
% Use the if-else construct to choose which one (-1 or +1) to pick for each element
vv = v';
for m = 1:length(vv)
    if rem(vv(m),2) == 0
        w(m) = 1;
    else 
        w(m) = (-1);
    end
    m = m+1;   
end
w = w';

% Similarly to previous but instead of a for loop, create the vector 'w2' by artihmetically manipulating the output of the modulo function ('mod') on the whole vector v
ww = mod(v,2);
w2 = (ww * (-2))+1;

% Find the maximum value of the elements of v and store it into variable 'v_max'
v_max = max(v);

% Find the index (not the value) of the minimum valued element of v into variable 'v_min_loc'. In case of multiple minima, store only the location of the first one.
v_min = min(v);
v_min2 = find(v==v_min);
v_min_loc = v_min2(1);
