function D = strainStressMatrix (E, nu, problem) 
%{
This function takes material properties (E and nu), and the problem type
(plain stress/ plane strain) as the inputs and generates the strain-stress
matrix ([D])
%}

problem = upper(erase(problem,' '));


switch problem
    case 'PLANESTRESS'
        % TODO
        % D = ...
    
    
    case 'PLANESTRAIN'
        % TODO
        % D = ...
end

end
