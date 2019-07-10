class Car_class :  # 클래스 객체
    def __init__(self): # 생성자
        self.car_name = '소나타'
        self.car_drv = '전륜'
        self.car_speed = 0
        self.car_direction = '앞쪽'
        self.car_fuel = '휘발유'
        self.car_state = '정상'
    def set(self, car_name, car_drv, car_speed, car_direction, car_fuel, car_state)
        self.car_name = car_name
        self.car_drv = ('전륜', '후륜', '4륜')
        self.car_speed = car_speed
        self.car_direction = ('왼쪽','오른쪽','앞쪽','뒤쪽','정지')
        self.car_fuel = ('휘발유','경유','LPG','수소','전기','하이브리드')
        self.car_state = ('정상', '브레이크고장', '전조등고장', '후미등고장', '연료부족',
                          '타이어펑크', '엔진오일부족', '냉각수부족', '폐차처리')


m2 = Myclass2() # init이 자동으로 생성된다.
get # 그래서 get으로 바로 부르면 됨