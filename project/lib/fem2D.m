%%                           MATLAB PROJECT                  
%__________________________________________________________________________
% 
%                        Finite Element Methods
%                              Spring 2020                      
% 
%--------------------------------------------------------------------------
%               Developed by  SHAHROKH SHAHI (www.sshahi.com) 
%__________________________________________________________________________

function Results = fem2D(Model)
% The main FEM function to analyze a 2d plane stress/strain structure
% defined by structure array "Model"


%% (A) Parameters (You do NOT need to modify this section):
%{
In the following, all the required parameters will be extracted from the
Model structure (all these data have already been read from the input
file):

(1) problem    : specifies the problem type ('plane stress' or 'plane strain' 
(2) nDim       : coordinates dimension (in this problem it is 2, since it is 2D problem)
(3) nDof       : number of degrees of freedom per each node (in this problem it is 2: u,v)
(4) nNode      : total number of nodes
(5) nElem      : total number of elements
(6) nElemNode  : number of nodes per each element e.g. 4 for a first-order quadrilateral element
(7) coordinates: a matrix including all nodes coordinates            (nNode x nDim     )
(8) elements   : a matrix including all elements connectivity data   (nElem x nElemNode)
(9) materials  : a matrix including all element material properties  (nElem x 3        )   (3: E, nu, t)
%}

problem     = Model.analysisType;

nDim        = Model.nDim ;
nDof        = Model.nDof ;
nNode       = Model.nNode;
nElem       = Model.nElem;
nElemNode   = Model.nElemNode;

coordinates = Model.geometry.coordinates;
elements    = Model.geometry.elements;
materials   = Model.sections(Model.elemSectId,:);

%% (B) Forming Global Stiffness Matrix

% initializing the variable to store global stiffness matrix
K = zeros(nDof * nNode);

% a loop over all elements to calculate elements' stiffness matrices and
% assemble the global stiffness matrix
for iElem = 1 : nElem
    connections = elements(iElem,:);           % a vector of element node numbers 
    elemCoord   = coordinates(connections,:);  % a matrix of element nodal coordinates    
    
    % call "elemStiff" function to calculate the element stiffness matrix
    k  = elemStiff(elemCoord, materials(iElem,:), problem);

    % assembly: finding the indices of corresponding entries in global 
    % matrix and assemble the global stiffness matrix
    %#ok<TODO>
    %
    %
    %
    % K(index,index) = ...
end


%% (C) Forming Global Equivalent Nodal Forces Vector

% initializing the variable (vector) to store global equivalent nodal force
F = zeros(nDof * nNode,1);

% (a) traction forces (finding their equivalent nodal forces)

if Model.nTractionForce > 0  % if there is at least one traction force, then:
    % extracting the tractions data from the Model structure
    tractions = Model.loading.tractionForces;
end
% loop over all the traction force data
for iTraction = 1 : Model.nTractionForce
    elem = tractions(iTraction,1);          % element number of i-th traction
    edge = tractions(iTraction,2);          % edge    number of i-th traction
    load = tractions(iTraction,3:end);      % the components of i-th traction [Tx, Ty]
    
    connections     = elements(elem,:);                 % a vector of element node numbers 
    edgeNodeIndex   = edgeNodes(nDim, nElemNode, edge); % a vector of THE edge nodes Ids
    edgeNodeNumbers = connections(edgeNodeIndex);       % a vector of THE edge nodes numbers 
    edgeCoord       = coordinates(edgeNodeNumbers,:);   % a matrix of coordinates of edge nodes
    
    % calling the function "elemEquivalentLoad" to calculate the element
    % equivalent nodal force
    f = elemEquivalentLoad(edgeCoord, load);
    
    % assembly: finding the indices of corresponding entries in global 
    % nodal forces and assemble the global nodal forces vector
    %#ok<TODO>
    %
    %
    %
    % F(index,:) = ...
end

% (b) (concentrated) nodal forces 
if Model.nNodalForce > 0 % if there is at least one concentrated nodal force, then:
    % extracting the nodal forces data from the Model structure 
    nodalForces = Model.loading.nodalForces;
end

% loop over all the nodal forces data
%#ok<TODO>
% for iNodal = 1 : Model.nNodalForce
%
%
%
% end

%% (D) Imposing Boundary Conditions and Solving the System

%{ 
boundary conditions components:
(1) bcIndex: a list (vector) of the degrees of freedom with boundary conditions
(2) bcValues: the prescribed displacements values
%}

bcIndex = (nDof*(Model.boundary(:,1)-1)+Model.boundary(:,2))';
bcValues = Model.boundary(:,3);


% calling the solution function to impose the boundary conditions and
% calculating the displacements and reaction forces
[displacements, reactionForces] = solution(K, F, bcIndex, bcValues);
displacements = reshape(displacements, nDim, nNode)';



%% (E) Calculating Strains and Stresses at Integration Points

% loop over all elements to calculate the elements' strains and stresses at
% integration points
for iElem = 1 : nElem
    connections = elements(iElem,:);           % a vector of element node numbers  
    elemCoord   = coordinates(connections,:);  % a matrix of element nodal coordinates 
    elemDisp    = displacements(connections,:);% a matrix of element nodal displacements  
    
    % generating a list of gauss quadrature integration points and weights
    % (in natural coordinates)
    [xiList, wList] = integrationPoints(nDim,nElemNode);
    
    % extracting the corresponding material properties
    E  = materials(iElem,1);
    nu = materials(iElem,2);
    
    %#ok<TODO>
    %
    %
    %
    %
    %
    %
    %
    %
    %
    % ...
    
    
end


%% (F) Storing All the Results in an Output Structure Array Called "Results"


%#ok<TODO>
% Results.KGlobal        = ...
% Results.FGlobal        = ...      
% Results.displacements  = ...
% Results.reactions      = ...
% Results.stresses       = ...
% Results.strains        = ...
%

end


