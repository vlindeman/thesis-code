import os
import glob
import shutil
import csv


with open('GT-final_test.csv', 'r') as f:
  reader = csv.reader(f)
  your_list = list(reader)

N = your_list.__len__()
print("List:")
print(your_list.__len__())
print("\n")


for filename in glob.glob('testbilder\*.jpg'):

    file = filename[-9:]
    for i in range(1,N):

        row = your_list[i][0].split(";")
        name = row[1]
        id = row[8]
        print(file)
        print(name)
        print(id)
        print(row)

        if(file == name+'.jpg'):
            print("moved")
            os.replace("testbilder/"+file, "testbilder/" + id + "/" + file)








