import numpy as np
import cv2
import cv2.aruco as ar
ad=ar.Dictionary_get(ar.DICT_4X4_50)
bd=ar.Dictionary_get(ar.DICT_5X5_250)
a=ar.drawMarker(ad,8,400)
b=ar.drawMarker(ad,27,400)
c=ar.drawMarker(bd,92,400)
d=ar.drawMarker(bd,4,400)
w=[255,255,255]
ab=cv2.copyMakeBorder(a,25,25,25,25,cv2.BORDER_CONSTANT,value=w)
bc=cv2.copyMakeBorder(b,25,25,25,25,cv2.BORDER_CONSTANT,value=w)
cd=cv2.copyMakeBorder(c,25,25,25,25,cv2.BORDER_CONSTANT,value=w)
ef=cv2.copyMakeBorder(d,25,25,25,25,cv2.BORDER_CONSTANT,value=w)
f= cv2.FONT_HERSHEY_SIMPLEX
r=(0,0,255)
cv2.putText(ab,'aruco id=8',(170,20),f,0.5,r,1,cv2.LINE_AA)
cv2.putText(bc,'aruco id=27',(170,20),f,0.5,r,1,cv2.LINE_AA)
cv2.putText(cd,'aruco id=92',(170,20),f,0.5,r,1,cv2.LINE_AA)
cv2.putText(ef,'aruco id=4',(170,20),f,0.5,r,1,cv2.LINE_AA)
cv2.imwrite('vf.jpeg',ab)
cv2.imwrite('qtr.jpeg',bc)
cv2.imwrite('df.jpeg',cd)
cv2.imwrite('qw.jpeg',ef)
