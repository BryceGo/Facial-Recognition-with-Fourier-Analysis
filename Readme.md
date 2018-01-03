This assignment uses fourier analysis to detect which face belongs to which person given a test image (test.pgm) and the database of images of many people in the folder ATT_Face_Database.
<br />
The main.m is the main function of the MATLAB code that iterates through every image in the database computing its euclidean distance and returning the best match.
<br />
This program was based on the paper of Hagen Spies and Ian Ricketts on their paper on Facial Recognition in Fourier Space. It uses the lower quadrant method in choosing the frequencies for the fourier analysis of the image.