clear clc;
clear all;
k = 1;
nu = 40;
N =65537;
x0 = 101.15520937701599;
%x = linspace(0., 2*x0 ,N);
%H = real(besselh(nu,k,z));
M = zeros(N,1);
fid = fopen('fdataHW5fs19.dat', 'w');
fid1 = fopen('fdataHW5fs19F.dat', 'w');


for i = 2:N
    x(i) = 2*x0*double(i-1)/double(N);
%   pause
 
    if (x(i) <= x0 ) 
       
        M(i) = real(besselh(nu,k,x(i)));
       
    else 
        
        M(i) =-real(besselh(nu,k,2*x0 - x(i)));
    end
    fprintf(fid,'%6.2f %12.8f\n', x(i), M(i));
    fprintf(fid1,'%12.8f\n', M(i));
end 
% fprintf(fid,'%g %g\n', 2*x0, -real(besselh(nu,k,0);
plot(x,M)
grid on
hold on
disp('lenth x')
disp( length(x))
disp('lenth M')
disp( length(M))
% fid = fopen('fdataHW5fs19.dat', 'w');
% if fid == -1, error('Cannot open file for writing.'); end
%     fprintf(fid,'6s %12s\r\n', x, M);
fclose(fid);

% x = (1:size(prcdata,1))./1.16E6;
% y = prcdata;
% xy = [x(:), y(:)];
% dlmwrite('YourOutputFile.txt', xy, 'delimiter', ',');

% filename = 'testHW5.txt'; % Whatever
% fid = fopen(filename, 'wt');
% if fid ~= -1
%     fprintf('%f\n', prcdata(:,6)); % Write out column 6 of prcdata.
%     fclose(fid);
% else
%     message = sprintf('Could not open file %s for writing', filename);
%     uiwait(warndlg(message));
% end