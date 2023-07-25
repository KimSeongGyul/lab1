x = 0:1:15;
fileID = fopen('vector.txt','w');
fprintf(fileID,'%d\n',x);
fclose(fileID);