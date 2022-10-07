%
% Returns the voltage profile (V(t)) of a spike for stdp
% parameters:
%   t: the times at which to evaluate the spike
%   t_spike: the time at which the spike fires (may be peak value)
%   width of spike (exact meaning depends on mode)
%   mode: Determines which spike shape to use:
%       1 = bi-triangular (one positive, one negative)
%       2 = bi-rectangular (one positive, one negative, same width)
%       3 = LTD dominated rectangular (negative twice the width)
%       4 = 90 deg skewed triangles
%       5 = very short rect pulse (width/10) and broader neg triangular
%       trailing part (width)
%   Returns V(t) in which maximum value is equal to 1
function V = STDPpulse(t, t_spike, width, mode)
if mode == 1
    V = zeros(length(t),1);
    for i = 1 : length(t)
        if t(i) >= t_spike - width/2 && t(i) <= t_spike
            V(i) = 2/width*(t(i)-t_spike+width/2);
        elseif t(i) > t_spike && t(i) <= t_spike + width
            V(i) = 1 - 2/width*(t(i)-t_spike);
        elseif t(i) > t_spike + width && t(i) < t_spike + 3*width/2
            V(i) = 2/width*(t(i)-t_spike-width)-1;
        end
    end
    return;
    
elseif mode == 2 %symmetric rect
    V = zeros(length(t),1);
    for i = 1 : length(t)
        if t(i) >= t_spike && t(i) <= t_spike + width
            V(i) = 1;
        elseif t(i) > t_spike + width && t(i) <= t_spike + width*2
            V(i) = -1;
        end
    end
    return;
elseif mode == 3 %LTD dominated rect
    V = zeros(length(t),1);
    for i = 1 : length(t)
        if t(i) >= t_spike && t(i) <= t_spike + width
            V(i) = 1;
        elseif t(i) > t_spike + width && t(i) <= t_spike + width*3
            V(i) = -1;
        end
    end
    return;
elseif mode == 4 %90 angle triangles
    V = zeros(length(t),1);
    for i = 1 : length(t)
        if t(i) >= t_spike - width && t(i) <= t_spike
            V(i) = 1/width*(t(i)-t_spike+width);
        elseif t(i) > t_spike && t(i) <= t_spike + width
            V(i) = -1 + 1/width*(t(i)-t_spike);
        end
    end
    return;
elseif mode == 5 %short pulse and broad neg triangle
    V = zeros(length(t),1);
    for i = 1 : length(t)
        if t(i) >= t_spike && t(i) <= t_spike+width/10
            V(i) = 1;
        elseif t(i) > t_spike + width/10 && t(i) <= t_spike + 11*width/10
            V(i) = -1 + 1/width*(t(i)-t_spike-width/10);
        end
    end
    return;
end

