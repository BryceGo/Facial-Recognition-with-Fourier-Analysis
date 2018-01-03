function fourier = fast_fourier(image)

    [rows columns] = size(image);
    pad_value = 2^nextpow2(max(rows,columns));

    fourier_image = fft2(image,pad_value,pad_value);
    shifted_image = fftshift(fourier_image);
    magnitude = abs(shifted_image);
    test_image = magnitude/max(magnitude(:));
    
    [newsize1 newsize2] = size(fourier_image);
    for y = 1:newsize1
        for x = 1:newsize2
            if ~(x >= newsize2/2 & y >= newsize1/2)
                test_image(y,x) = 0;
            end
        end
    end
    fourier = test_image;
end