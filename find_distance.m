function distance = find_distance(fft_image1,fft_image2)
    difference_and_square = (fft_image1-fft_image2).^2;
    distance = sqrt(sum(difference_and_square(:)));
    %distance = sqrt((sum(fft_image1(:)))^2 + (sum(fft_image2(:)))^2);
end