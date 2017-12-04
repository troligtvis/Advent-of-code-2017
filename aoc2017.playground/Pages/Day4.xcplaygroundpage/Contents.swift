import Foundation

func countValidPassphrases(from input: String, part: Part) -> Int {
    let linesString = input.components(separatedBy: "\n")
    let lines = linesString.map { $0.components(separatedBy: " ") }
    
    var count = 0
    for words in lines {
        let s = part == .one ? words : words.map { String($0.sorted()) }
        let w = Array(Set(s))
        guard w.count == words.count else { continue }
        count += 1
    }
    return count
}

func testCountValidPassphrases(from input: String, expected value: Int, part: Part) -> Bool {
    return countValidPassphrases(from: input, part: part) == value
}

func partOne(_ input: String) {
    let inputTest =
    """
    aa bb cc dd ee
    aa bb cc dd aa
    aa bb cc dd aaa
    """
    guard testCountValidPassphrases(from: inputTest, expected: 2, part: .one) else {
        print("Test failed")
        return
    }
    
    let solution = countValidPassphrases(from: input, part: .one)
    print("Solution:", solution)
}

func partTwo(_ input: String) {
    let inputTest =
    """
    abcde fghij
    abcde xyz ecdab
    a ab abc abd abf abj
    iiii oiii ooii oooi oooo
    oiii ioii iioi iiio
    """
    guard testCountValidPassphrases(from: inputTest, expected: 3, part: .two) else {
        print("Test failed")
        return
    }
    
    let solution = countValidPassphrases(from: input, part: .two)
    print("Solution:", solution)
}

partOne(input)
partTwo(input)
