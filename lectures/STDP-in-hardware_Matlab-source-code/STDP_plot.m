%generate data for STDP plot
t = linspace(0, 100, 101);
t_pr = 30 : 70;
dt = zeros(length(t_pr),1);
Vmax = zeros(length(t_pr), 1);
dW = zeros(length(t_pr), 1);
threshold = 0.6;

filename = 'stdp_bio.gif';

for i = 1 : length(t_pr)
    t_pre = t_pr(i);
    t_post = 50;
    dt(i) = t_pre - t_post;
    V_pre = -STDPpulse(t,t_pre, 10, 5)*0.5;
    V_post = -STDPpulse(t, t_post, 10, 5)*0.5;

    Vbias = V_pre-V_post;
    Vma = max(Vbias);
    Vmi = min(Vbias);
    if Vma > abs(Vmi)
        Vmax(i) = Vma;
    elseif Vma < abs(Vmi)
        Vmax(i) = Vmi;
    else
        Vmax(i) = 0;
    end
    if abs(Vmax(i)) > threshold
        dW(i) = sign(Vmax(i))*(exp(2*(abs(Vmax(i))-threshold))-1);
    end
end

%generate plots

for i = 1 : length(t_pr)
    t_pre = t_pr(i);
    V_pre = -STDPpulse(t,t_pre, 10, 5)*0.5;
    V_post = -STDPpulse(t, t_post, 10, 5)*0.5;

    Vbias = V_pre-V_post;
    
    h = figure(1);
    clf
    subplot(1,3,1)
    plot(t, Vbias, '-c', t, V_post, '-r', t,V_pre,'b-');
    xlabel('Time (ms)')
    ylabel('Volt (V)')
    legend({'Bias', 'V_{post}','V_{pre}'})
    axis([min(t), max(t), min(Vmax), max(Vmax)])
    subplot(1,3,2)
    plot(dt, Vmax,'b',dt, ones(length(dt),1)*threshold,'k--',dt, -ones(length(dt),1)*threshold,'k--')    
    hold on
    plot(t_pre-t_post, Vmax(i),'r*')
    xlabel('t_{pre} - t_{post} (ms)')
    ylabel('Maximum bias (V)')
    subplot(1,3,3)
    plot(dt, dW,'b')    
    hold on
    plot(t_pre - t_post, dW(i),'r*')
    xlabel('t_{pre} - t_{post} (ms)')
    ylabel('\Delta w')
    
    drawnow

    
    
     frame = getframe(h); 
     im = frame2im(frame); 
     [imind,cm] = rgb2ind(im,256); 
     % Write to the GIF File 
       if i == 1 
           imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
       else 
           imwrite(imind,cm,filename,'gif','WriteMode','append'); 
       end 

end