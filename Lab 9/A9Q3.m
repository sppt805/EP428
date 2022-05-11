%% A9Q3 - Professor Image
Acolor = imread('Chary.jpg');
A = sum(Acolor,3,'double');
m = max(max(A));
A = A*255/m;

figure(1)
colormap(gray);
imagesc(A);
title('RAW IMAGE');

[U,S,V] = SingularValueDecomp(A);

figure(2)
plot(diag(S)/max(diag(S))*100);
title('Compressd Image Term Size');

res = 100;
Anew = SVDReconstruct(U,S,V,res);

figure(3)
colormap(gray);
imagesc(Anew);
title(res, ' singular values');

res = 50;
Anew = SVDReconstruct(U,S,V,res);

figure(4)
colormap(gray);
imagesc(Anew);
title(res, ' singular values');

res = 5;
Anew = SVDReconstruct(U,S,V,res);

figure(5)
colormap(gray);
imagesc(Anew);
title(res, ' singular values');

%% A9Q3 - Country Flag
Acolor = imread('Flag-India.jpg');
A = sum(Acolor,3,'double');
m = max(max(A));
A = A*255/m;

figure(1)
colormap(gray);
imagesc(A);
title('RAW IMAGE');

[U,S,V] = SingularValueDecomp(A);

figure(2)
plot(diag(S)/max(diag(S))*100);
title('Compressd Image Term Size');

res = 100;
Anew = SVDReconstruct(U,S,V,res);

figure(3)
colormap(gray);
imagesc(Anew);
title(res, ' singular values');

res = 50;
Anew = SVDReconstruct(U,S,V,res);

figure(4)
colormap(gray);
imagesc(Anew);
title(res, ' singular values');

res = 5;
Anew = SVDReconstruct(U,S,V,res);

figure(5)
colormap(gray);
imagesc(Anew);
title(res, ' singular values');