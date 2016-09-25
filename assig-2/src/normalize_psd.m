function psd_normalized = normalize(psd)    
    % I tried normalizing the results but the plots turn out
    % be uneven hence and altered in peaks, hence not using normalization

    % psd_normalized = (psd - min(psd))./(max(psd)-min(psd));
    psd_normalized = psd ;
end