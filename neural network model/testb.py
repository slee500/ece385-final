import numpy as np

hidden_weights = open('hidden_weights.txt', 'r')
hidden_biases = open('hidden_biases.txt', 'r')
out_weights = open('out_weights.txt', 'r')
out_biases = open('out_biases.txt', 'r')

input_file = open('test_img_01.txt', 'r')

array = np.loadtxt(hidden_weights, dtype = int, ndmin = 2)
array = array.transpose()

matrix = np.matrix(array)

array1 = np.loadtxt(input_file, dtype = int)
array1 = array1.reshape(1,784)
#print array1

hidden_biases_array = np.loadtxt(hidden_biases, dtype = int, ndmin = 2)
#print hidden_biases_array.shape
partial_res = np.dot(array1,matrix) + hidden_biases_array.transpose()
#print partial_res

array2 = np.loadtxt(out_weights, dtype = int, ndmin = 2)
array2 = array2.transpose()
out_biases_array = np.loadtxt(out_biases, dtype = int, ndmin = 2)

final_res = np.dot(partial_res,array2) + out_biases_array.transpose()
print final_res