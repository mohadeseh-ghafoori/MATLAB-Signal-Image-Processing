function [y] = real_cepstrum(x)
    DFDT = fft(x);
    magnitude_DFDT = abs(DFDT);
    magnitude_DFDT = magnitude_DFDT + eps; %because log 0 isn't undefined
    Ln_magnitude_DFDT = log(magnitude_DFDT);
    y = ifft(Ln_magnitude_DFDT);
end

