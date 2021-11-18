import UIKit

//딕셔너리를 만들 때 처음에 값들을 알고 있는 경우
//딕셔너리 만드는 오리지널 방법
let family : [String:String] = ["dad" : "홍길동", "mom" : "홍길순"]

print(family)

//튜플(=레코드). 키 밸류가 쌍으로 프린트 됨
for x in family{
    print(x.key, x.value)
}

//딕셔너리를 만들 때 처음에 값들을 모르고 있다가 나중에 넣는 경우
var hobby : [Int : String] = [ : ] //[]만 쓰면 배열이라, 딕셔너리는 :를 가운데 넣어 준다.

hobby.updateValue("달리기", forKey: 1)
hobby.updateValue("독서", forKey: 2)
hobby.updateValue("등산", forKey: 3)

print(hobby) //[1: "달리기"]

hobby[3] = "수영" //등산->수영으로 값 변경
print(hobby) //[3: "수영", 2: "독서", 1: "달리기"]

for(key, value) in hobby{
    print(key, value) //3 수영    2 독서    1 달리기
}

hobby.removeValue(forKey: 3)
print(hobby) //수영 지움
print(hobby.count) //2


//===옵셔널 바인딩===

var food : String?
print(food)

var food2 : String? = "우동"
food2 = nil
print(food2) //nil도 넣을 수 o

food2 = "떡볶이"
//print(food2 ?? "감자")
//print(food2) //Optional("떡볶이")
//print(food2 + "를 먹었어요.") //같은 타입만 결합연산자로 쓸 수 있음. 옵셔널객체 + 스트링이라 에러
print(food2! + "를 먹었어요.") //!로 언랩핑하여 스트링으로 만듦

var count : Int? = 100
//100에다 100을 더한 것
print(count) //Optional(100)
var result = count! + 100
print("내가 가진 개수는 " + String(result))


var today : Character = "화"
switch today {
case "토", "일":
    //body 부분을 비워 두면 안 됨!
    print("주말입니다.")
case "월", "화":
    print("주중입니다.")
    fallthrough //break 안 걸고 밑의 것까지 다 실행
default:
    print("놀자!!!!!")
}

//튜플로 리턴
func startEnd(array: [Int]) -> (start: Int, end: Int){
    var s = array[0]
    var e = array[array.count-1]
    return (s, e)
}
var arr = [1000, 2000, 3000]
print(startEnd(array: arr))
var (result1, result2) = startEnd(array: arr)
//첫째값을 안 쓰고 버릴 때 변수 대신 언더바_를 쓴다.
//var (_, result2) = startEnd(array: arr)
print(result1) //1000
print(result2) //3000

var names = ["홍길동", "홍길순", "홍길정", "홍길장"]
//제일 친한 친구 이름과 세번째로 친한 이름, 마지막으로 친한 이름 함수 정의
//함수 호출
//세번째 친구 이름은 변수에 저장하지 말아주세요.
//프린트 제일 친한 친구 이름, 마지막으로 친한 친구 이름만 프린트
//단순히 값 모을때는 튜플을 써라!
//파라메터의 의미를 더 강조하기 위해 별명을 지을 수 있다.
//별명 사용법: 별명 파라메터명:데이터타입
//파라메터명 생략하고자 하는 경우: _(omit, 생략 연산자)
func getNames(a2 arr2 : [String]) -> (f1:String, f3:String, f4:String){
    return (arr2[0], arr2[2], arr2[arr2.count-1])
}

var (n1, _, n3) = getNames(a2: names) //_를 써주면 arr2:를 생략가능하나, alias는 써줘야함
print("첫번째 친한 친구 이름은 ", n1)
print("첫번째 친한 친구 이름은 ", n3)


//default value 설정 가능
func setLevel(_ name: String, _ level: String = "보통등급"){
    print(name + "님의 등급은 " + level + "입니다.")
}
setLevel("홍길동") //홍길동님의 등급은 보통등급입니다.
setLevel("홍길순", "VIP등급") //홍길순님의 등급은 VIP등급입니다.

func hobby(_ fields: String...){ //여러개를 넣을 수 있는 ...
    print(fields)
}
hobby("운동", "헬스", "달리기")
hobby("뜨개질", "바느질")





