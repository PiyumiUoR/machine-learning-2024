function [g_min, w_min, g_history, w_history] = coordinateSearch (g, w0, max_iter)
  
  % Dimension of the problem
  n = size(w0,2); % << THE NUMBER OF VARIABLES FROM WO >>
  
  % Standard basis in both directions (+ and). These are the possible step directions of coordinate search 
  B = [eye(n); -eye(n)];
  
  % Initial point and the function value at it. These are the estimates of the minimum, updated at each iteration.
  W_min = w0; %<< SET TO INITIAL POINT >>
  g_min = g(w0); % << COMPUTE & AT THE INITIAL POINT >>
  
  % Initialize search history, if requested
  if nargout > 2
    w_history = [w_min];
    g_history = [g_min];
  end
  
  % Perform coordinate descent
  for i = 1:max_iter
  
    % Make (unit) steps into all search directions from w_min at once
    w_candidates = w_min [ones (n); ones (n)] + B; % << BASED ON w_min and B, COMPUTE ALL THE NEW CANDIDATE POINTS (2NxN matrix). KEEP THE ORDERING OF THE DIRECTIONS SAME AS IN B. >>
    
    % Compute function values at all the seach points at once
    g_candidates = g(w_candidates); % << APPLY g TO w_candidates >>>>>
    
    % Find the best direction based on the function values at the candidate points. The index of the best value corresponds to the best direction in B 
    [best_val, best_ind] = min(g_candidates); % << FIND THE BEST VALUE AND ITS LOCATION FROM g_candidates >>
    
    g_min = best_val; % << STORE THE VALUE OF & AFTER TAKING THE BEST STEP >>
    w_min = w_candidates (best_ind,:); % << STORE THE UPDATED LOCATION AFTER TAKING THE BEST STEP USING w_candidates and best_ind >>
  
    if nargout > 2 %Store history if requested
      g_history = [g_history; g_min);
      w_history = [w_history; w_min];
    end
  end
end

% The function to be minimized 
f = @(w) w(:,1).^2+ w(:,2).^2 + 2;

% Starting point for the descent 
x0 = [3 4];

% Upper limit of iterations
MAX_ITER = 10;

% Call the coordinateSearch function 
[g_min, w_min, g_history, w_history] = coordinateSearch(f, x0, MAX_ITER)

% Plot the result (not mandatory, but beneficial)
figure
plot(g_history) 
title('Cost history')
xlabel('Iteration number')
ylabel('Cost (g(w))')
