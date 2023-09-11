import UIKit
import Foundation
import Darwin

//var result = 0
//
//let N = 5, M = 3
//let B = [1, 10, 3], E = [7, 2, 5]
//let A = [[1, 2, 3], [4, 2, 3], [4, 2, 5], [6, 2, 5], [7, 2, 5]]
//
//var temp = countMatchArray(B, A[0])
//if temp > M*2 - 2 {
//    print("Stop: Result = ", 0)
//}
//if temp == M {
//    print("Stop: Result = ", 1)
//}
//for i in 1..<N {
//    temp = countMatchArray(A[i], A[i-1])
//    if temp > M*2 - 2 {
//        print("Stop: Result = ", 0)
//    }
//
//    temp = countMatchArray(A[i], E)
//    if temp == M {
//        print("Stop: Result = ", i+1)
//    }
//    print("Temp = ", temp)
//}
//func countMatchArray(_ A: [Int], _ B: [Int]) -> Int {
//    var temp = Set<Int>()
//    for itemA in A {
//        temp.insert(itemA)
//    }
//    for itemB in B {
//        temp.insert(itemB)
//    }
//    return temp.count
//}

////// Extension to NumberFormatter for ordinal spell out
//extension NumberFormatter {
//    func ordinalSpelledOutString(from number: NSNumber) -> String? {
//        numberStyle = .ordinal
//        return string(from: number)
//    }
//}
//
//// Custom string interpolation method
//extension String.StringInterpolation {
//    mutating func appendInterpolation(spellOutRandomNumber number: Int) {
//        let randomNumber = NSNumber(value: number)
//        let formatter = NumberFormatter()
//        formatter.locale = Locale(identifier: "en_US") // Use your desired locale
//
//        if let spelledOutString = formatter.string(from: randomNumber) {
//            appendLiteral(spelledOutString)
//        }
//    }
//}
//
//// Usage
//let randomInt = Int.random(in: 1...100)
//let interpolatedString = "\(spellOutRandomNumber: randomInt) is spelled out."
//print(interpolatedString)

////Blank 1: Extend the string interpolation to add custom interpolations
//extension String.StringInterpolation {
//    mutating func appendInterpolation(_ number: Int, style: NumberFormatter.Style) {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = style
//        if let result = formatter.string(from: number as NSNumber) {
//            appendLiteral(result)
//        }
//    }
//}
//
//let number = Int.random(in: 0...100)
//let lucky = "The number is \(number, style: .spellOut)"
//print(lucky)

//func a(x : () -> Void) {
//    print("c")
//    x()
//    print("a")
//}
//
//a(x: {
//    () in
//    print("b")
//})

//@dynamicCallable
//struct Repeater {
//    func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Int>) -> String {
//        return pairs.map { label, count in
//            repeatElement(label, count: count).joined(separator: " ")
//        }
//        .joined(separator: "\n")
//    }
//}

//let repeatLables = Repeater()
//print(repeatLables(a:1, b:2, c:3, b:2, a:1))
//
//@dynamicCallable
//struct RandomNumberGenerator {
//    func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, Int>) -> Double {
//        let numberOfZeroes = Double(
//            args.first?.value ?? 0
//        )
//        let maximum = pow(10, numberOfZeroes)
//        return Double.random(in: 0...maximum)
//    }
//}
//
//let random = RandomNumberGenerator()
//let result = random(0)
//print(result)

//func minMoves(x1: Int, y1: Int, x2: Int, y2: Int) -> Int {
//    var result = -1
//
//    if x1 < 1 || x1 > 8 || y1 < 1  || y1 > 8 || x2 < 1 || x2 > 8 || y1 < 1 || y2 > 8 {
//        return result
//    }
//
//    let sum = x1 + x2 + y1 + y2
//    if sum % 2 == 0 {
//        let temp1 = abs(x1-x2)
//        let temp2 = abs(y1-y2)
//        if temp1 == temp2 {
//            return 1
//        }
//        return 2
//    }
//
//    return result
//}

//var T = Int(readLine()!)!
//for _ in 1...T {
//    var temp_inp = readLine()!
//    var temp_array = temp_inp.split {$0 == " "}
//    var temp = temp_array.map { Int($0)! }
//
//    var x1 = temp[0]
//    var y1 = temp[1]
//    var x2 = temp[2]
//    var y2 = temp[3]
    
//    print(minMoves(x1: 4, y1: 3, x2: 8, y2: 5))
//}

//func minimumPalindromes(str: String) -> Int {
//    if str.count < 2 {
//        return str.count
//    }
//    var map: [Character:Int] = [:]
//    var result = 0
//    let strs = Array(str)
//    for s in strs {
//        let count = (map[s] ?? 0) + 1
//        map[s] = count
//    }
//
//    for item in map.keys {
//        let val = map[item]!
//        if val%2 != 0 {
//            result += 1
//        }
//    }
//
//    return result
//}
//
//print(minimumPalindromes(str: "bbaaa"))

//func isPalindrome(str: String) -> Bool {
//    let strs = Array(str)
//    var left = 0, right = strs.count-1
//    while left <= right {
//        if strs[left] != strs[right] {
//            return false
//        }
//        left += 1
//        right -= 1
//    }
//    return true
//}

//extension String.StringInterpolation {
//    mutating func appendInterpolation(_ number: Int, style: NumberFormatter.Style) {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = style
//
//        if let result = formatter.string(from: number as NSNumber) {
//            appendLiteral(result)
//        }
//    }
//}
//
//let number = Int.random(in: 0...100)
//let lucky = "The number is \(number, style: .spellOut)"
//print(lucky)


func alphaNum(str: String) -> String {
    var strs = Array(str).map { String($0) }
    
    for i in 0..<strs.count {
        if strs[i] >= "A" && strs[i] <= "Z" {
            strs[i] = strs[i].lowercased()
        } else if strs[i] >= "a" && strs[i] <= "z" {
            strs[i] = strs[i].uppercased()
        }
    }
    
    return strs.joined()
}
print(alphaNum(str: "aye_TVT_92"))

//func absoluteDifference(n: Int, s: String) -> Int {
//    if n < 1 {
//        return 0
//    }
//    var result = 0
//    let strs = Array(s)
//    var index = 0
//    var currentOnes = 0, currentZeros = 0
//
//    while index < n {
//        currentOnes = 0
//        currentZeros = 0
//        if strs[index] == "1" {
//            if index == 0 {
//                currentOnes = 1
//            }
//
//            var temp = index - 1
//            while temp >= 0 && strs[temp] == "0" {
//                currentZeros += 1
//                temp -= 1
//            }
//
//            temp = index + 1
//            while temp < n && strs[temp] == "1" {
//                currentOnes += 1
//                temp += 1
//            }
//
//            result += abs(currentOnes-currentZeros)
//        }
//        index += 1
//    }
//
//    return result
//}
//print(absoluteDifference(n: 5, s: "10010"))
//print(absoluteDifference(n: 5, s: "11011"))
//print(absoluteDifference(n: 7, s: "0101100"))












