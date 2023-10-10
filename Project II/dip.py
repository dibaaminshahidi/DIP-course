import cv2 
import numpy as np 
from skimage.measure import compare_mse, compare_ssim
from PIL import Image
import glob


# att1 = cv2.imread("./Attack1/1_5.bmp")
# att2 = cv2.imread("./Attack2/1_5.bmp")
# original = cv2.imread("./Original/1.bmp")
# halftone = cv2.imread("./Halftone/1_5.bmp")
# ssims =[]

# att1 = cv2.cvtColor(att1 ,cv2.COLOR_BGR2GRAY) 
# halftone = cv2.cvtColor(halftone, cv2.COLOR_BGR2GRAY)
# 
#att2c = cv2.cvtColor(att2, cv2.COLOR_BGR2GRAY) 
#original = cv2.cvtColor(original, cv2.COLOR_BGR2GRAY) 

# Convert to grayscale. 
for i in range (10):
    z=i+1 
    original = cv2.imread('./Original/'+str(z)+'.bmp')
    orig = cv2.cvtColor(original ,cv2.COLOR_BGR2GRAY) 

    for j in range (5):
        name = str(z)+'_' + str(j+1)+'.bmp'
        att1 = cv2.imread('./Attack1/'+name)
        att2 = cv2.imread('./Attack2/'+name)
        halftone = cv2.imread('./Halftone/'+name)
        print(name)
        att1 = cv2.cvtColor(att1 ,cv2.COLOR_BGR2GRAY) 
        halftone = cv2.cvtColor(halftone, cv2.COLOR_BGR2GRAY) 
        
        height, width = halftone.shape 

        orb_detector = cv2.ORB_create(5000) 

        kp1, d1 = orb_detector.detectAndCompute(att1, None) 
        kp2, d2 = orb_detector.detectAndCompute(halftone, None) 

        # Hamming distance as measurement mode. 
        matcher = cv2.BFMatcher(cv2.NORM_HAMMING, crossCheck = True) 

  
        matches = matcher.match(d1, d2) 

        matches = matches[:int(len(matches)*100)] 
        no_of_matches = len(matches) 

        p1 = np.zeros((no_of_matches, 2)) 
        p2 = np.zeros((no_of_matches, 2)) 

        for i in range(len(matches)): 
            p1[i, :] = kp1[matches[i].queryIdx].pt 
            p2[i, :] = kp2[matches[i].trainIdx].pt 

        homography, mask = cv2.findHomography(p1, p2, cv2.RANSAC) 


        transformed_img = cv2.warpPerspective(att2, 
                            homography, (width, height))
        cv2.imwrite(name+'.jpg', transformed_img) 
        trans = cv2.cvtColor(transformed_img ,cv2.COLOR_BGR2GRAY) 
        s , sd = compare_ssim(orig,trans,full=True)
        m = compare_mse(orig,trans)
        print(name, 's=' ,s ,'m=',m ,'mp=' ,no_of_matches)
