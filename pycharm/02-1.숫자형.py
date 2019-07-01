# 02-1.숫자형.py

# 표준 입출력

# 표준 입력 : 변수 = input("문자열")

# a = input()
# print(a)
# 중간에서부터 디버그를 실행시킬 수 없으므로 위에껀 주석문처리

# math = input("수학점수:")         # 문자열 타입을 반환
# english = input("영어점수:")      # 문자열 타입을 반환
# total = int(math) + int(english) # 문자열을 숫자로 형변환
# print('총점:',total)

# 표준 출력 : print()
print('add : ', 4 + 5, 'sub = ', 4 - 2)
print(1, 2);print(3, 4)    # 새로운 프린트문이 나오면 다음 줄로 출력됨
                           # 마지막에 자동으로 \n
print(1, 2, end = '/')     # end : 프린트문을 내려서 출력하고 싶지 않고, 같이 나오게끔 하는 표현
print(5, 6, 7)             # 마지막에 \n 대신 '/'로 출력
                           # ,사이 문자를 빈칸으로 구분하여 출력
print(5, 6, 7, sep = ':')  # ,사이 문자를 ':'로 구분하여 출력

# print() formatting
num_1 = 10 # int형
num_2 = 1.234 # floot형
str_1 = "Hello Python"
print("int형:%d"%num_1)    # %d : int형
print("floot형:%f"%num_2)  # %f : floot형
print("16진수:0x%x"%num_1) # %x : 16진수
print("8진수:%o"%num_1)    # %o : 8진수
print("문자열:%s"%str_1)   # %s : 문자열
print("문자열:%s"%num_2)   # %s : 문자열, 형변환 과정을 거친
# print("int형:%d"%str_1)  # %d : int형, 문법 오류로 사용할 수 없음
print("문자열:%s, int형:%d"%(str_1, num_2))   # 문자열과 int형

# fomat()함수 사용
print(format(1.234567, "7.6f")) # 전체 7자리, 소수점 6자리
print('{0}, {1}'.format('apple', 7.77)) # {1},{2} 첫 번째와 두 번쨰 인수를 의미
print('{0:<10}{1:5.2f}'.format('apple', 7.77)) # apple      7.77
print('{0:>10}{1:5.2f}'.format('apple', 7.77)) #      apple 7.77
print('{0:^10}{1:5.2f}'.format('apple', 7.77)) #   apple    7.77
print('{0:=<10}{1:5.2f}'.format('apple', 7.77))# apple===== 7.77
print('{0:=>10}{1:5.2f}'.format('apple', 7.77))# =====apple 7.77
print('{0:=^10}{1:5.2f}'.format('apple', 7.77))# ==apple=== 7.77

# 숫자형 변수
# int 형

a= 12345
print(int(a))  # 2진수
print(bin(15)) # 2진수
print(hex(15)) # 16진수
print(oct(15)) # 8진수

# float 형 : 실수형
print(float(a)) # 12345.0

# complex floot 형 : 복소수형
print(complex(a)) # (12345+0j)

print(float('inf')) #무한대 # inf

num = float('inf')
print(num/1000) # inf/점수 ==> inf
print(10000/num) # 정수/inf ==> 0.0
print(num/num) # inf/inf ==> non, Not a Number
num = float('nan') # ==> 'nan'

# 사칙연산 : +, -, ", /, %, //, **
a = 10
b = 3
c = a + b
d = a - b
e = a * b
f = a / b
print(f) # 3.3333
g = a % b
print(g) # %(나머지) : 1
f2 = a // b
print(f2) # //(정수 몫) : 3
h = a ** b # a의 b제곱
print(h) # 10^3 ==> 1000

print("Hello"*3) # HelloHelloHello
print("-"*50)