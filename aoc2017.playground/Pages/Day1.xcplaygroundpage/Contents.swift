import Foundation

extension String {
    func toArray() -> [String] {
        return self.map { $0.description }
    }
}

func captcha(input: [String], part: Part) -> Int {
    var sum = 0
    for (index, value) in input.enumerated() {
        let nextValue: String = {
            switch part {
            case .one: return input[(index + 1) % input.count]
            case .two: return input[(index + input.count / 2) % input.count]
            }
        }()
        sum += value == nextValue ? Int(value)! : 0
    }
    return sum
}

func testCaptcha(input: [String], expected value: Int, part: Part) -> Bool {
    return captcha(input: input, part: part) == value
}

func partOne(input: String) {
    guard testCaptcha(input: "1122".toArray(), expected: 3, part: .one),
          testCaptcha(input: "1111".toArray(), expected: 4, part: .one),
          testCaptcha(input: "1234".toArray(), expected: 0, part: .one),
          testCaptcha(input: "91212129".toArray(), expected: 9, part: .one) else {
            print("Tests failed")
            return
    }

    let solution = captcha(input: input.toArray(), part: .one)
    print("Solution:", solution)
}

func partTwo(input: String) {
    guard testCaptcha(input: "1212".toArray(), expected: 6, part: .two),
          testCaptcha(input: "1221".toArray(), expected: 0, part: .two),
          testCaptcha(input: "123425".toArray(), expected: 4, part: .two),
          testCaptcha(input: "123123".toArray(), expected: 12, part: .two),
          testCaptcha(input: "12131415".toArray(), expected: 4, part: .two) else {
            print("Tests failed")
            return
    }
    let solution = captcha(input: input.toArray(), part: .two)
    print("Solution:", solution)
}

partOne(input: input)
partTwo(input: input)
