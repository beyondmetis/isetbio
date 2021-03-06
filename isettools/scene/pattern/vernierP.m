function params = vernierP(varargin)
% Default vernier stimulus parameters
%
%   p = vernierP;
%
% Parameters to specify a vernier scene.  
%
% Generally  used with 
%   
%      scene = sceneCreate('vernier','display',params), or
%
%      oisCreate('vernier', ....)
%
% Parameters:
%
%  name      - Used by oiSequence.visualize
%  display   - Display structure
%  sceneSz   - Pixels on display
%  offset    - Pixels on display
%  bgColor   - Background color, e.g., [.6 .4 .2]
%  barLength - Pixels
%  gap       - Gap between upper and lower pattern (filled with bgColor)
%  barColor  - Bar color, e.g., [.6 .4 .2]
%  pattern   - Spatial pattern
%
% Examples
%   p = vernierP; 
%   p.name = 'example'; s = sceneCreate('vernier','display',p);
%   ieAddObject(s); sceneWindow;
%
%   p.bgColor = [1 0 0]; p.barColor = [0 1 0]; 
%   s = sceneCreate('vernier','display',p); ieAddObject(s); sceneWindow;
%
%   p.barLength = 8;  
%   s = sceneCreate('vernier','display',p); ieAddObject(s); sceneWindow;
%
%   x = (-32:32)/64; f = 2; pattern = 0.5*cos(2*pi*f*x) + 0.5;
%   p = vernierP('pattern',pattern,'offset',6,'barLength',12);
%   s = sceneCreate('vernier','display',p); ieAddObject(s); sceneWindow;
%
% See also
%   sceneCreate('vernier', ...) , oisCreate('vernier',...), imageVernier
%
% BW, ISETBIO Team, 2016

%% Parse arguments

p = inputParser;

p.addParameter('name','unknown',@ischar);

p.addParameter('display',displayCreate('LCD-Apple','wave',400:10:700),@isstruct);
p.addParameter('sceneSz',[50 50],@isnumeric);

p.addParameter('offset',1,@isscalar);
p.addParameter('bgColor',0.5,@isscalar);

p.addParameter('barWidth',1,@isnumeric);
p.addParameter('barLength',[],@isscalar);
p.addParameter('barColor',1,@isscalar);

p.addParameter('gap',0,@isscalar);

p.addParameter('pattern',[],@ismatrix);

p.parse(varargin{:});

%% Assign parameters

params = p.Results;

% % Identifier
% params.name  = p.Results.name;           % Char
% 
% % Display scene
% params.display  = p.Results.display;     % Display structure
% params.sceneSz  = p.Results.sceneSz;     % Pixels
% 
% % General
% params.offset   = p.Results.offset;      % Pixels
% params.bgColor  = p.Results.bgColor;     % 0 to 1?
% 
% % Bar properties.  Define better
% params.barWidth  = p.Results.barWidth;    % Pixels
% params.barLength = p.Results.barLength;   % Pixels?
% params.barColor  = p.Results.barColor;    % (rgb?)
% 
% params.pattern   = p.Results.pattern;    % Spatial
% params.gap       = p.Results.gap;

end
