# 05-1 클래스.py : 클래스(추상적인 개념), 인스턴스(구체적인 개념)

# 파이썬 클래스 관련 용어 :
# 클래스(class): class 문으로 정의 하여, 멤버와 메서드를 가지는 객체이다.
# 새로운 이름 공간 을 갖는 단위이다.
# 클래스 객체(class object) : 클래스와 같은 의미, 특정대상이 아니다.

# 클래스 인스턴스(class instance) : 클래스를 호출하여 생성된 객체
# 클래스 인스턴스 객체(class instance object) : 클래스 인스턴스와 같은 의미
# 이는 인스턴스 객체라고 부르기도 한다.

# 멤버(Member) : 클래스 혹은 클래스 인스턴스 공간에 정의된 변수
# 메서드(Method) : 클래스 공간에 정의된 함수, def로 정의
# 속성(attribute) : 멤버와 메서드 전체를 가리킨다.
# 상속 : 상위 클래스의 속성과 그대로 받아들이고 추가로 필요한 기능을 덧붙이는 것
# 받아들이고 추가로 필요한 기능을 덧붙이는 것



# 클래스와 클래스 인스턴스 객체의 생성
# class 클래스 이름 :
#           속성 ...
class Simple : # 클래스 구조 생성
    pass
print(Simple) # <class '__main__.Simple'>

s1 = Simple() # 클래스의 인스턴스 객체
print(s1) # <__main__.Simple object at 0x000001E2C4DAABE0>
s2 = Simple() # 클래스의 인스턴스 객체
print(s2) # <__main__.Simple object at 0x000002893D9B5FD0>

# del s1  # 객체의 삭제, 파이썬에서 직접 삭제시킬 필요가 없다.
# print(s1) # NameError: name 's1' is not defined



# 멤버 접근 : [1] 클래스 멤버, [2] 인스턴스 멤버

# [1] 클래스 멤버
# (1) 클래스 멤버의 구현과 접근 방법
class Myclass :  # 클래스 객체
    cl_mem = 100 # 클래스 멤버
    cl_list = [1, 2 ,3] # 클래스 멤버
    a = ' Hi' # 클래스 멤버

# (2) 클래스 객체를 통해 접근[읽기]
print(Myclass.cl_mem)
print(Myclass.cl_list)
print(Myclass.a)

# (3) 클래스 멤버 변경
Myclass.cl_mem = 200
print(Myclass.cl_mem) # 200
Myclass.cl_list = [4, 5, 6]
print(Myclass.cl_list )
Myclass.a = 'bye'
print(Myclass.a)

# (1-1) 클래스 인스턴스 객체를 통한 접근
ml = Myclass() # 클래스의 인스턴스 객체 # 인스턴스안에서만 값이 바뀜
print(ml.cl_mem)      # 200
print(ml.cl_list)
print(ml.a)

# (1-2) 클래스의 인스턴스 객체를 통해 변경
ml.cl_mem = 300
print(ml.cl_mem)      # 300 # 인스턴스 객체를 통해 변경하면 , 인스턴스의 값만 변경되고
print(Myclass.cl_mem) # 200 # 클래스의 멤버값은 변경되지 않는다.



# [2] 인스턴스 멤버
# (1) 인스턴스 멤버의 구현과 접근 방법
# 클래스의 메서드 내에 구현한 멤버 ; 인스턴스 멤버
# self.변수명 = 값
class Myclass2() :
    def __init__(self): # 생성자, 인스턴스 객체를 생성할 떄 자동으로 생성된다.
        print('Myclass2의 생성자가 호출되었어요')
        self.in_mem = 0
        self.in_list = [0]
        self.a = 0
    def set(self, var): # 메서드 ; 클래스안의 함수
        print('set is called!!')
        self.in_mem = var        # 인스턴스 멤버(in.mem)
        self.in_list = [1, 2, 3] # 인스턴스 멤버(in.mem) # 변수가 아니라 변동이 없음
        self.a = 100             # 인스턴스 멤버(in.mem) # 변수가 아니라 변동이 없음
    def get(self):
        print('get is called!!')
        return self.in_mem, self.in_list, self.a

    def __del__ (self):
        print('Myclass2의 소멸자가 호출되었어요')

m2 = Myclass2() # 클래스의 인스턴스 객체
m2.set(30)
mem, l, a = m2.get() # 언패킹
print(mem, l, a ) # 30 [1, 2, 3] 100

m2.set(50)
mem, l, a = m2.get() # 언패킹
print(mem, l, a ) # 50 [1, 2, 3] 100

# m3 = Myclass2()
# mem, l, a = m3.get() # set을 안해서 변수들이 없어서 오류가 난다.

m3 = Myclass2()
m3.set(30)
mem, l, a = m3.get()
print(mem, l, a ) # 30 [1, 2, 3] 100

mem, l, a = m2.get()
print(mem, l, a ) # 50 [1, 2, 3] 100
del m2
input()