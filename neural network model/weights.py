import numpy as np

def writeSV(fileName, descrip):
    myFile = open(fileName+'.txt', 'r')
    array = np.loadtxt(myFile, dtype = int, ndmin = 2)

    array = array.transpose()

    print 'We have a matrix of height', len(array), 'and width', len(array[0])
    print 'Writing',fileName,'...'

    output = open(fileName+'_sv.txt', 'w')

    for row in range(len(array)):
        myStr = str(row)+': '+descrip+' = \'{'
        
        for col in range(len(array[0])):
            comma = ',' if col < len(array[0])-1 else '};\n'
            myStr2 = str(array[row][col])+comma
            myStr += myStr2

        output.write(myStr)

    print 'Write to file', fileName+'_sv.txt' ,'complete.\n'

writeSV('hidden_weights', 'counter1_out')
writeSV('out_weights', 'counter2_out')

writeSV('hidden_biases', 'counter1_bias')
writeSV('out_biases', 'counter2_bias')