# 제어문 실습문제
# 1-1번 제어문만 이용하여 작성(시퀀스 자료형 사용안함)
print( '{0:=^50}'.format( '1-1번' ) )
for x in range(1, 101):
     if x % 10 == 0:
         print(x)
     else:
         print(x, end=',')

# 1-2번 시퀀스 자료형을 이용하여 작성(list 내장)
#print( '{0:=^50}'.format( '1-2번' ) )
#l = [ x for x in range(1, 101) if x % 10 == 0]
#print(l)


# 2번 1~n 까지의 합을 출력 하는 프로그램(제어문 사용)
print( '{0:=^50}'.format( '2번' ) )
number = int (input( 'Input number : ' ) )
number2 = [n for n in range(1, number + 1)]
print( 'sum = {0:<6}'.format( sum( number2 ) ) )


# 3번 1~n 까지 짝수합과 홀수합을 출력하는 프로그램
print( '{0:=^50}'.format( '3번' ) )
a = input( 'Input number : ' )
l = int (input( 'Input number : ' ) )
a = [n for n in range(2, l+1, 2)]
b = [n for n in range(1, l+1, 2)]
print('짝수합 : ', sum(a), ', 홀수합 : ', sum(b))


# 4번
print( '{0:=^50}'.format( '4번' ) )
number = int (input( 'Input number : ' ) )
number2 = [n for n in range(1, number + 1)
     if n % 3 != 0 and n % 5 != 0]
print( 'sum = {0:<6}'.format( sum( number2 ) ) )


# 5-1번
print( '{0:=^50}'.format( '5-1번' ) )
for x in range(1, 10) :
    for y in range(1, 10) :
        print(x, '*', y, '=', x*y)


# 5-2번
print( '{0:=^50}'.format( '5-2번' ) )
a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
for x in a :
    for y in a :
        print(x, '*', y, '=', x*y)


# 6번
print( '{0:=^50}'.format( '6번' ) )
ad = []
while True :
     a = int(input( 'input number :'))
     ad.append(a)
     if a == -999: break

q = 0; w = 0; e = 0; r = 0 # 양수 / 음수 / 짝수 / 홀수
for x in ad:
    if x > 0:
        q = q + 1
        if x % 2 == 0:  # if문의 if문
            e = e + 1
        else:
            r = r + 1
    elif x < 0 :
        w = w + 1
    else:
        pass
print('양수 : {0} 음수 : {1} 짝수 : {2} 홀수 : {3}'.format(q, w, e, r))
# 입력 # ad.append(a) #  브레이크 # 개수를 출력


# 7번
print( '{0:=^50}'.format( '7번' ) )
number1 = input( 'Input number1 : ' )
number2 = input( 'Input number2 : ' )
op_select = int( input( 'Input operator( 1:+, 2:-, 3:*, 4:/ ) : ' ) )

a = ['+', '-', '*', '/']
b = [1, 2, 3, 4]
s = {x: y for x, y in zip(b, a)}
print(s)

first = eval( number1 + s[op_select] + number2 )
print( '{0:^6} + {1:^6} = {2:<6}'.format( number1, number2, first ) )


# 8번
print( '{0:=^50}'.format( '8번' ) )
from collections import namedtuple
a = []; b = []; c = []; d =[]; f =[]

# 이름을 받고, 제한은 10명이내, end로 들어오면 break

for x in range(10):
    q = input('input name :' )
    a.append(q)
    if q == 'end': break
    b=[]
    for l in range(3):
        w = int(input('input score :' ))
        b.append(w)
    a.append(b)
    e = sum(b)
    a.append(e)
    g = sum(b) / len(b) # b로 한다
    a.append(g)
    if g >= 90:
        a.append('Excellent')
    elif g <= 50:
        a.append('Fail')
    else:
        a.append('') # 빈칸이 있으면 인덱싱하기가 힘들어서
for h in range(0, x*5, 5):
    f = str(a[h:h + 5])
    print(f)









