function keys = dtmfrun(iv,L,fs)

dtmf.keys = ... 
   ['1','2','3','A';
    '4','5','6','B';
    '7','8','9','C';
    '*','0','#','D'];

dtmf.colTones = ones(4,1)*[1209,1336,1477,1633];
dtmf.rowTones = [697;770;852;941]*ones(1,4);

    %Define 1x8 vector of frequencies
center_freqs = [dtmf.rowTones(:,1)' , dtmf.colTones(1,:)]; 

    %hh = Lx8 Matrix of all the filters. Each column contains the impulse
    %response of one BPF
hh = dtmfdesign(center_freqs, L, fs);

    %Find beginning and end of tone bursts
[nstart,nstop] = dtmfcut(iv,fs);

keys = []; %Initialize keys
locs = []; %Initialize locs
for kk=1:length(nstart) %Each tone
    x_seg = iv(nstart(kk):nstop(kk)); %Extract single DTMF tone
    locs = []; %Clears previous locations

    for jj=1:length(center_freqs) %Eeach filter
        %Boolean vector (approximate location of frequency components)
        locs = [locs, dtmfscore(x_seg,hh(:,jj))];
    end
    
        %Vector creation with occurrance of ones:
    aa = find(locs == 1);
    
    if length(aa) ~= 2 | aa(1) > 4 | aa(2) < 5
            %Skipping all impossible scores
        continue
    end
    
        %Decodes row and col position from aa
    row = aa(1);
    col = aa(2)-4;

        %Sets 'keys' equal to the curr keys and the key found in this
        %iteration
    keys = [keys, dtmf.keys(row,col)];
end
end
