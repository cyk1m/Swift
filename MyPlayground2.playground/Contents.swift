import UIKit

print("플레이그라운드 잘되나 테스트!!")

var shopingList = ["달걀", "우유"] //String

print(shopingList)

var shoppingList2 : [String] = []

shoppingList2.append("가방")
shoppingList2.append("볼펜")
shoppingList2.append("마우스")

print(shoppingList2)

shoppingList2[0] = "맥"
print(shoppingList2[0])

print("전체 쇼핑 리스트의 개수는 \(shoppingList2.count)개")

//shopingList2[3] = "물"

shoppingList2.insert("충전기", at: 1)
print(shoppingList2)

shoppingList2.remove(at: 0)
print(shoppingList2)

var count = 0
for x in shoppingList2{ //foreach
    print("꺼낸 값은 ", x)
//if x == "볼펜"{
//    print("컴퓨터 관련 물건이 아니에요.")
//
//}else{
//    print("컴퓨터 관련 물건이에요.")
//}
    if x == "볼펜"{
        continue
    }
    count = count + 1
}

print("전체 중에서 컴퓨터 관련 물건의 개수는 ", count, "개")

//튜플: 읽기 전용
for(index, value) in shoppingList2.enumerated(){
    print(index, ": ", value)
}

for x in 0..<5{
    print(x)
}

for x2 in 0..<shoppingList2.count{
    print(shoppingList2[x2])
}

//Int배열 1,3,5,6,7,8를 만들어서 각 배열의 인덱스와 값을 프린트

//각 배열의 값에 100씩을 더해서 프린트
//배열의 값 중 짝수, 홀수의 개수를 더해서 프린트

//var num2 : Int = 100
//num2 = nil
//print(num2)

//1. Int 배열 1,3,5,6,7,9를 만들어서 각 배열의 인덱스와 값을 프린트 해보세요.
var num : [Int] = []
num.insert(1, at: 0)
num.insert(3, at: 1)
num.insert(4, at: 2)
num.insert(6, at: 3)
num.insert(7, at: 4)
num.insert(9, at: 5)

for (index, value) in num.enumerated() {
    print(index, ": ", value)
}

// 2. 각 배열의 값에 100씩을 더해서 프린트
for x in num {
    var num2 : Int? = 100
    print(num2! + x)
}

// 3. 배열의 값 중 짝수, 홀수의 개수를 더해서 프린트
var evenCount = 0
var oddCount = 0

for x in num {
    if x % 2 == 0 {
        evenCount += 1
    } else {
        oddCount += 1
    }
}
print("짝수의 개수는 \(evenCount)개, 홀수의 개수는 \(oddCount)개")
