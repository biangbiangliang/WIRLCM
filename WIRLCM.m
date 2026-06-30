function out = WIRLCM(img)
    mask = ones(3,3);
    temp1 = ordfilt2(img, 9, mask,'symmetric');
    temp2 = ordfilt2(img, 8, mask,'symmetric');
    temp3 = ordfilt2(img, 7, mask,'symmetric');

    win_size = [3,4,5,6,7];

    temp = (4*temp1 + 3*temp2 + 2*temp3)/9;
    fil_img_array = zeros(size(img, 1), size(img, 2), length(win_size));
    for i = 1:length(win_size)    
        radiu = win_size(i); 
        B_mask = genCircle(radiu);
        num = sum(sum(B_mask));
        fil_img_1 = ordfilt2(img, num, B_mask, 'symmetric');
    
        h = fspecial("gaussian", radiu*2 + 1, 0.5*radiu);   
        B_mask = h.*B_mask;
        B_mask = B_mask/sum(sum(B_mask));
        
        fil_img = imfilter(img, B_mask, "replicate");        
        fil_img_array(:,:,i) = max(0, (temp./fil_img)) .* max(0, (temp./fil_img_1 - 1));
    
        re_fil_img = max(fil_img_array, [], 3);
    end
    out = re_fil_img .* mpg(img) .* csf(img);
    out = (out-min(out(:)))/(max(out(:))-min(out(:)));
end