# class_method.py
# calculator 클래스 구현
# 1. class 선언
# 2. 클래스 멤버를 정의
# 3. 생성자를 구현
# 4. 메서드를 구현
# 5. 소멸자는 생략해도 된다.
# 6. 클래스의 인스턴스 객체를 만들고 메서드를 호출해본다.
# 7. 모듈로 제공하기 위한 처리 ( if __name__ == '__main__' : )

class Calculator :
    a = 10 # 여기에서는 클래스 멤버를 그냥 넣어보는 걸로
    b = 20
    def __init__(self, a, b):
        print('생성자 호출')
        self.a = a
        self.b = b

    def add(self, a, b):
        self.a = a
        self.b = b
        return self.a + self.b

    def subtract(self, a, b):
        self.a = a
        self.b = b
        return self.a - self.b

    def multiply(self, a, b):
        self.a = a
        self.b = b
        return self.a * self.b

    def devide(self, a, b):
        self.a = a
        self.b = b
        return self.a / self.b

#    def __del__(self):
#       print('소멸자 호출')

if __name__ == '__main__' :
    c1 = Calculator(1, 1)
    print('a :', c1.a, ',', 'b :', c1.b)
    print(c1.add(20, 30))
    print(c1.subtract(20, 30))
    print(c1.multiply(20, 30))
    print(c1.devide(20, 30))




