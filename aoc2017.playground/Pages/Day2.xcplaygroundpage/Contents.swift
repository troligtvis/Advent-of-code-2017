import Foundation

extension String {
    func toGrid() -> [[Int]] {
        let rows = self.components(separatedBy: "\n")
        let columns = rows.map { $0.components(separatedBy: " ").filter { $0 != "" }.flatMap { Int($0) } }
        return columns
    }
}

func differenceBetweenMaxMin(_ array: [Int]) -> Int {
    guard let min = array.min(), let max = array.max() else {
        return 0
    }
    return abs(max - min)
}

func evenlyDivide(_ array: [Int]) -> Int {
    for outer in array {
        for inner in array {
            guard outer != inner else { continue }
            let maxValue = max(outer, inner)
            let minValue = min(outer, inner)

            guard maxValue % minValue == 0 else { continue }
            return maxValue / minValue
        }
    }

    return 0
}

func checksum(input: [[Int]], part: Part) -> Int {
    var sum = 0
    for row in input {
        sum += part == .one ? differenceBetweenMaxMin(row) : evenlyDivide(row)
    }
    return sum
}

func testChecksum(input: [[Int]], expected value: Int, part: Part) -> Bool {
    return checksum(input: input, part: part) == value
}

func partOne(input: String) {
    let test = [[5, 1, 9, 5], [7, 5, 3], [2, 4, 6, 8]]
    guard testChecksum(input: test, expected: 18, part: .one) else {
        print("Test failed")
        return
    }
    let solution = checksum(input: input.toGrid(), part: .one)
    print("Solution:", solution)
}

func partTwo(input: String) {
    let test = [[5, 9, 2, 8], [9, 4, 7, 3], [3, 8, 6, 5]]
    guard testChecksum(input: test, expected: 9, part: .two) else {
        print("Test failed")
        return
    }
    let solution = checksum(input: input.toGrid(), part: .two)
    print("Solution:", solution)
}

partOne(input: input)
partTwo(input: input)
