function weight = mpg(img)
    se1 = [0,1,0;1,1,1;0,1,0];
    imgt1 = double(ordfilt2(img, 5, se1));
    imgt2 = double(ordfilt2(img, 4, se1));
    img1 = (1*imgt1 + 1*imgt2)/2;
    se2 = [-1,-2,-1,-2,-1;-2,0,3,0,-2;-1,3,8,3,-1;-2,0,3,0,-2;-1,-2,-1,-2,-1];
    weight = max(0, double(imfilter(img1, se2,"symmetric")));
end