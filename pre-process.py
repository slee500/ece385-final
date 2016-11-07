# Pre-process data so that we only have 0's and 1's in the training and test labels
import os

def read_input(path):
    filePath = os.path.normcase(os.path.join(os.path.dirname(__file__), path))
    if not os.path.exists(filePath):
        print 'The file', filePath, 'does not exist.'
        print 'Please check the working directory and try again.'
        quit()

    else:
        inputFile = open(filePath, 'r')
        return inputFile

# Get data from test image and file
def pre_process(imageFile, labelFile, outputImage, outputLabel):
    for line in labelFile:
        label = int(line.rstrip('\n'))
        if label == 0 or label == 1:
            outputLabel.write(str(label))
            outputLabel.write('\n')
        
        for j in range(0,28):
            imageLine = imageFile.readline()
            if label == 0 or label == 1:
                #outputImage.write(imageLine)
                for i in imageLine:
                    if i == ' ':
                        outputImage.write('0')
                    elif i == '+' or i == '#':
                        outputImage.write('1')
                    else:
                        outputImage.write(i)
                


imageFile1 = read_input('digitdata/trainingimages')
labelFile1 = read_input('digitdata/traininglabels')
outputImage1 = open('inputdata/trainingimages', 'w')
outputLabel1 = open('inputdata/traininglabels', 'w')

imageFile2 = read_input('digitdata/testimages')
labelFile2 = read_input('digitdata/testlabels')
outputImage2 = open('inputdata/testimages', 'w')
outputLabel2 = open('inputdata/testlabels', 'w')

pre_process(imageFile1, labelFile1, outputImage1, outputLabel1)
pre_process(imageFile2, labelFile2, outputImage2, outputLabel2)

print 'Pre-processing complete.'