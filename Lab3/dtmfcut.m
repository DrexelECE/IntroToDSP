function [nstart,nstop] = dtmfcut(iv,fs)
%dtmfcut.m: Find the DTMF tones within input signal

setpoint = 0.02; %Zero entirety below 2% zero

iv = iv(:)' / max(abs(iv)); %Normalize 'iv'
Lx = length(iv);
Lz = round(0.01*fs);

iv = filter(ones(1,Lz) / Lz, 1, abs(iv));
iv = diff(iv > setpoint);

jkl = find(iv ~= 0)';

%xx(jkl);
if iv(jkl(1)) < 0, jkl = [1; jkl];  end
if iv(jkl(end)) > 0, jkl = [jkl; Lx]; end

%jkl';
indx = [];
while length(jkl)>1
	if jkl(2)>(jkl(1)+10*Lz)
		indx = [indx, jkl(1:2)];
	end
	jkl(1:2) = [];
end

nstart = indx(1,:);
nstop = indx(2,:);
