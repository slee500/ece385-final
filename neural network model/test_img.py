myFile = open('test_img.txt', 'r+')
out = open('test_img_bench.txt', 'w+')
out2 = open('test_img_01.txt', 'w+')
i = 0
for line in myFile:
    #print line
    splitLine = line.split()
    #print splitLine
    #raw_input('...')
    for num in splitLine:
        i += 1
        out.write('#2 ')
        if num[0] == '0':
            out.write('pixel = 0;\n')
            out2.write('0 ')
        elif num[0] == '1':
            out.write('pixel = 1;\n')
            out2.write('1 ')

    out.write('\n')
    out2.write('\n')


print 'Write complete.', i