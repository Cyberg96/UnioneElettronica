#Enrico Ubaldino
import cv2

import numpy as np

import matplotlib.pyplot as plt

 
#Creo variabile per avvio cattura frame. 0 prima webcam, 1 la seconda
live_Camera = cv2.VideoCapture(0)

 

 #lower_bound = np.array([11,33,111])
lower_bound = np.array([18,50,50])
lower_bound = np.array(lower_bound, dtype="uint8")

#upper_bound = np.array([90,255,255])
upper_bound = np.array([35,255,255])
upper_bound = np.array(upper_bound, dtype="uint8")

 

while(live_Camera.isOpened()):

    ret, frame = live_Camera.read()

    frame = cv2.resize(frame,(1280,720))

    frame = cv2.flip(frame,1)

 

    frame_smooth = cv2.GaussianBlur(frame,(7,7),0)
    cv2.imshow("Image Gauss",frame_smooth)
    
    frame_hsv = cv2.cvtColor(frame_smooth,cv2.COLOR_BGR2HSV)
    cv2.imshow("Image HSV",frame_hsv)
    
    mask = cv2.inRange(frame_hsv, lower_bound, upper_bound)
 

    output = cv2.bitwise_and(frame,frame_hsv, mask)
    cv2.imshow("Image processing",output)
    image_binary = output

 

    check_if_fire_detected = cv2.countNonZero(mask)

   

    if int(check_if_fire_detected) >= 20000 :

        cv2.putText(frame,"Fire Detected !",(300,60),cv2.FONT_HERSHEY_COMPLEX,3,(0,0,255),2)
        print('Fire detected')
    

 

    cv2.imshow("Fire Detection",frame)
    

 

    if cv2.waitKey(10) == 27 :

        break

 

live_Camera.release()

cv2.destroyAllWindows()
=======
###########################################
#########   Enrico Ubaldino  ##############
###########################################

import cv2

import numpy as np

import matplotlib.pyplot as plt

 
#Creo variabile per avvio cattura frame. 0 prima webcam, 1 la seconda
live_Camera = cv2.VideoCapture(0)

 

 #lower_bound = np.array([11,33,111])
lower_bound = np.array([18,50,50])
lower_bound = np.array(lower_bound, dtype="uint8")

#upper_bound = np.array([90,255,255])
upper_bound = np.array([35,255,255])
upper_bound = np.array(upper_bound, dtype="uint8")

 

while(live_Camera.isOpened()):

    ret, frame = live_Camera.read()

    frame = cv2.resize(frame,(1280,720))

    frame = cv2.flip(frame,1)

 

    frame_smooth = cv2.GaussianBlur(frame,(7,7),0)
    cv2.imshow("Image Gauss",frame_smooth)
    
    frame_hsv = cv2.cvtColor(frame_smooth,cv2.COLOR_BGR2HSV)
    cv2.imshow("Image HSV",frame_hsv)
    
    mask = cv2.inRange(frame_hsv, lower_bound, upper_bound)
 

    output = cv2.bitwise_and(frame,frame_hsv, mask)
    cv2.imshow("Image processing",output)
    image_binary = output

 

    check_if_fire_detected = cv2.countNonZero(mask)

   

    if int(check_if_fire_detected) >= 20000 :

        cv2.putText(frame,"Fire Detected !",(300,60),cv2.FONT_HERSHEY_COMPLEX,3,(0,0,255),2)
        print('Fire detected')
    

 

    cv2.imshow("Fire Detection",frame)
    

 

    if cv2.waitKey(10) == 27 :

        break

 

live_Camera.release()

cv2.destroyAllWindows()

