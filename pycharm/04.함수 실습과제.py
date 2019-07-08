# 기본 실습
def printList(title,numberPerLine,prnList) :
    count = 0
    print(title)
    for k in prnList :
        count = count + 1
        print(k, end = ' ')
        if count % numberPerLine == 0:
            print()

title = "-- 성적테이블 --"
l = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
number = 4
printList(title, number, l)

# 1번 평균을 반환하는 함수를 작성
print( '{0:=^50}'.format( '1번' ) )
a = int(input('Input number1 : '))
b = int(input('Input number2 : '))
def fuc_mean(a, b) :
    for n in range(1, a + 1):
        for n in range(1, b + 1):
            if a == -1 : break
            sum = a + b
            g = sum / 2
            return g
l = fuc_mean(a, b)
print('평균 :', l)


# 2번 최대값과 최소값을 반환하는 함수 작성
print( '{0:=^50}'.format( '2번' ) )
ad = []
while True :
     a = int(input( 'input number :'))
     ad.append(a)
     if a == -1: break

for x in ad:
    if x == ad[0] : # 초기값
        q = x       # q = 최대값
        w = x       # w = 최소값
        if q < x :  # q가 x보다 작으면
           q = x
           w = q
        else :      # q가 x보다 크면
             w = x
    elif w > x :
         w = x
    else :
        pass
def max_min(ad) :
    return q, w
print(max_min(ad))


# 3번 시작과 끝 숫자를 받아 시작부터 끝까지의 모든 정수값의 합을 반환하는 함수
print( '{0:=^50}'.format( '3번' ) )
ad = []
while True :
     a = int(input( 'input number :'))
     ad.append(a)
     if ad[0] > ad[-1] : break

def frist(ad) : # 시작부터 끝까지의 모든 정수값의 합
    l = sum(ad)
    return l
k = frist(ad)
print(k)


# 4번
print( '{0:=^50}'.format( '4번' ) )
a = []
for x in range(5):
    q = input('input city :' )
    a.append(q) # a로 할당함
    if q == 'end': break

def l1(a):
    for x in a :
        if x == a[0] :
            a[0] = a[0][0:3]
            return a[0]
        elif x == a[1] :
            a[1] = a[1][0:3]
            return a[1]
        elif x == a[2] :
            a[2] = a[2][0:3]
            return a[2]
        elif x == a[3] :
            a[3] = a[3][0:3]
            return a[3]
    else:
        pass
print(l1(a))


# 5번
print('{0:=^50}'.format( '5번' ) )


