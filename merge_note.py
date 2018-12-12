# -*- coding: utf-8 -*-
import os
file_path="C:/gitcode/mrgray.notebook/"
fields_path=file_path+'fileds/'

filelist=os.listdir(fields_path)

newfile=open(file_path+'notebook.sh','w')
for item in filelist:
    for txt in open(fields_path+item,'r'):
        newfile.write(txt)

newfile.close()