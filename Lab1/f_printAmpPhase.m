function f_printAmpPhase(x)
    fprintf('Vector: %5.4g + %5.4gi \tAmplitude: %g \tPhase: %g\n', real(x), imag(x), f_amplitude(x), f_phase(x));
end

