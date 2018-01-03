%{
clear all;
close all;
current_max = 0;
current_mean = 0;
current_image = 0;
correct_sum = 0;

for test_folder = 1:40
    test_folder_name = strcat('ATT_Face_Database/s',int2str(test_folder));
    test_folder_name = strcat(test_folder_name,'/');
    for test_image = 1:10
        test_image_name = strcat(test_folder_name,int2str(test_image));
        test_image_name = strcat(test_image_name,'.pgm');
        image1 = imread(test_image_name);
        %image1 = imrotate(image1,5);
        for folder_number = 1:40
            folder_name = strcat('ATT_Face_Database/s',int2str(folder_number));
            folder_name = strcat(folder_name,'/');
            image_sum = 0;
            for image_number = 1:10
                image_number_char = int2str(image_number);
                filename = strcat(image_number_char,'.pgm');
                path = strcat(folder_name,filename);

                image2 = imread(path);

                ff1 = fast_fourier(image1);
                ff2 = fast_fourier(image2);

                %image_sum = image_sum + sqrt(sum(dot(ff1,ff2)));
                image_sum = image_sum + find_distance(ff1,ff2);
            end
            current_mean = image_sum/10;
            if(current_mean < current_max) | folder_number == 1
                current_max = current_mean;
                current_image = folder_number;
                current_path = path;
            end
        end
        
        if (current_image == test_folder)
            correct_sum = correct_sum + 1
        end
        %current_image
        %current_max
    end
end

correct_sum/400

%}

clear all;
close all;
current_max = 0;
current_mean = 0;
current_image = 0;


image1 = imread('test.pgm');
%image1 = imrotate(image1,5);
for folder_number = 1:40
    folder_name = strcat('ATT_Face_Database/s',int2str(folder_number));
    folder_name = strcat(folder_name,'/');
    image_sum = 0;
    for image_number = 1:10
        image_number_char = int2str(image_number);
        filename = strcat(image_number_char,'.pgm');
        path = strcat(folder_name,filename);

        image2 = imread(path);

        ff1 = fast_fourier(image1);
        ff2 = fast_fourier(image2);
        
        %image_sum = image_sum + sqrt(sum(dot(ff1,ff2)));
        image_sum = image_sum + find_distance(ff1,ff2);
    end
    current_mean = image_sum/10;
    if(current_mean < current_max) | folder_number == 1
        current_max = current_mean;
        current_image = folder_number;
        current_path = path;
    end
end

current_image
current_max



