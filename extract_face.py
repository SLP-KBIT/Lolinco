# -*- coding: utf-8 -*-

# http://famirror.hateblo.jp/entry/2015/12/19/180000

import cv2
import sys
import os
import shutil

args = sys.argv
argc = len(args)

if(argc != 2):
	print '引数を指定して実行してください。'
	quit()

image_path = args[1]

cascade_path = "/usr/local/share/OpenCV/haarcascades/haarcascade_frontalface_alt.xml"

base_dir = "./face"

# ファイル読み込み
image = cv2.imread(image_path)
if(image is None):
	print '画像を開けません。'
	quit()

# グレースケール変換
image_gray = cv2.cvtColor(image, cv2.cv.CV_BGR2GRAY)

# カスケード分類器の特徴量を取得する
cascade = cv2.CascadeClassifier(cascade_path)

# 物体認識(顔認識)の実行
facerect = cascade.detectMultiScale(image_gray, scaleFactor=1.2, minNeighbors=2, minSize=(10, 10))

# 顔を検出できなかった場合は終了
if len(facerect) == 0:
	quit()

# ファイル名の取得
filename = image_path.split("/")[-1]
path = filename.split(".")

dir_path = base_dir + '/' + path[0]
if os.path.isdir(dir_path):
	shutil.rmtree(dir_path)
os.mkdir(dir_path)

i = 0;
for rect in facerect:
	#顔だけ切り出して保存
	x = rect[0]
	y = rect[1]
	width = rect[2]
	height = rect[3]
	dst = image[y:y+height, x:x+width]
	new_image_path = dir_path + '/' + str(i) + '.' + path[1];
	cv2.imwrite(new_image_path, dst)
	i += 1

