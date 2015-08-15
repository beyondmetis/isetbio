function hdl = plotDisplaySPD(vci)
%Plot the spectral power distribution of the display primaries
%  
%  hdl = plotDisplaySPD(vci)
%
% See Also: plotDisplayGamut
%
% Copyright ImagEval Consultants, LLC, 2005

error('Use ISET instead');
if notDefined('vci'), vci = vcGetObject('vci'); end

hdl = vcNewGraphWin;
d = imageGet(vci,'display');
wave = displayGet(d,'wave');
spd  = displayGet(d,'spd');

plot(wave,spd(:,1),'r',wave,spd(:,2),'g',wave,spd(:,3),'b');
grid on;
xlabel('Wavelength (nm)');
ylabel('Radiance (watts/sr/m2/nm)');

data.wave = wave;
data.spd = spd;
set(gca,'userdata',data);

return;