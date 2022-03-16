import cv2
import winsound
import threading

def playaudio():
    winsound.PlaySound('video.wav', winsound.SND_FILENAME)

windowname = "Gruesse aus der Q2!"

threading.Thread(target=playaudio).start()

cap = cv2.VideoCapture('video.mp4')

if (cap.isOpened()== False): 
    print("Error opening video  file")
    exit()

cv2.namedWindow(windowname, cv2.WND_PROP_FULLSCREEN)
cv2.setWindowProperty(windowname, cv2.WND_PROP_FULLSCREEN, cv2.WINDOW_FULLSCREEN)

while(cap.isOpened()):

    ret, frame = cap.read()
    if not ret:
        break

    cv2.imshow(windowname, frame)

    if cv2.waitKey(30) & 0xFF == ord('q'):
        break


cap.release()
cv2.destroyAllWindows()
