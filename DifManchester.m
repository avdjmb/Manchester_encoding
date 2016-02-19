clc;
x = input('Enter the binary sequence');
if( max(x)>1 || min(x)<0)
    disp('error')
    return
end
N = length(x);
n=0.001:0.001:N;
line=zeros(1,1000*N);
subplot(211)
plot(n,(square(2*pi*1*n,50)/2)+0.5,'LineWidth',3);
xlabel('time')
ylabel('amplitude')
title('clock')
if x(1)== 1
    line(1,1:500) = 1;
    line(1,500:1000) = 0;        
else
    line(1,0:500) = 0;
    line(1,500:1000) = 1; 
end
for l=1:1:N-1
    if x(l+1)== 1
        line(1,(l*1000):(l*1000+500)) =line(1,(l*1000-500):(l*1000));
        line(1,(l*1000+500):(l*1000+1000)) =~line(1,(l*1000):(l*1000+500));        
    else
        line(1,(l*1000):(l*1000+500)) = ~line(1,(l*1000-500):(l*1000));
        line(1,(l*1000+500):(l*1000+1000)) = ~line(1,(l*1000):(l*1000+500)); 
    end
end
subplot(212)
plot(n,line,'LineWidth',3)
xlabel('time')
ylabel('amplitude')
title('Differential Manchester coding waveform')
