# class_import.py

import class_method as cm

if __name__ == '__main__' :
    c1 = cm.Calculator(10, 20)
    print('a :', c1.a, ',', 'b :', c1.b)
    print(c1.add(20, 30))
    print(c1.subtract(20, 30))
    print(c1.multiply(20, 30))
    print(c1.devide(20, 30))