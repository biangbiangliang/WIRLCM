function weight = csf(img)

    A = {ones(2,2);ones(3,3);ones(4,4);[0,1,1,0;1,1,1,1;1,1,1,1;0,1,1,0];ones(5,5)};
    Asize = size(A);
    toparray = zeros(size(img, 1), size(img, 2), Asize(1,1));
    for i = 1:Asize(1,1)
        se = A{i,1};
        image2 = imtophat(img, se);
        toparray(:,:,i) = image2;
    end
    image = max(toparray, [], 3);
    imgd = double(img);
    sz = 3;
    [lambda_1, lambda_2] = structure_tensor_lambda(imgd, sz);
    weight = (lambda_1 .* (lambda_1 .* lambda_2) ./ (lambda_1 + lambda_2)).*image;
    maxvalue = max(max(weight));
    minvalue = min(min(weight));
    weight = (weight - minvalue)/(maxvalue - minvalue);

end