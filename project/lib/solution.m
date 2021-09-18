function [displacements, reactionForces] = solution(K, R, bcIndex, bcValues)
%{
This function imposes the boundary conditions on the assembled global
matrices and calculates the displacements and reaction forces
%}

dofTotal = length(R);                     % number of all dofs
dofActive = setdiff(1:dofTotal, bcIndex); % a list (vector) of free dofs



% imposing boundary conditions
% TODO
% Kf = ...
% Rf = ...

% solving the system
% TODO
% u =...




% forming the displacements vector using both free dofs values and the
% prescribed displacements values

% TODO
displacements            = zeros(dofTotal,1);
% displacements = ...




% calculating reaction forces

% TODO
% reactionForces = ...

end

