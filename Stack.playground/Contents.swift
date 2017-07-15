//: Playground - noun: a place where people can play

import Cocoa

public struct Stack<Element> {
    fileprivate var array:[Element] = []
    
    public mutating func push(_ element:Element) {
        self.array.append(element)
    }
    
    public mutating func pop() -> Element? {
        return self.array.popLast()
    }
    
    public func peek() -> Element? {
        return self.array.last
    }
    
    public var isEmpty:Bool {
        get {
            return self.array.isEmpty
        }
    }
    
    public var count:Int {
        get {
            return self.array.count
        }
    }
}

extension Stack:CustomStringConvertible {
    public var description:String {
        let td = "---Stack---\n"
        let dd = "\n-----------\n"
        
        let stackElementsAsStrings = self.array.map { "\($0)" }
        let reversedStackElements = stackElementsAsStrings.reversed()
        let se = reversedStackElements.joined(separator:"\n")
        
        return td + se + dd
    }
}

extension String {
    public func index(of char:Character) -> Int? {
        if let idx = self.characters.index(of: char) {
            return self.characters.distance(from: self.startIndex, to: idx)
        }
        return nil
    }
}

public struct Matcher {
    private let string:String
    private let opening = "{[("
    private let closing = "}])"
    
    init(string:String) {
        self.string = string
    }
    
    public func check() -> Bool {
        var s = Stack<Character>()
        for c in self.string.characters {
            if opening.characters.contains(c) {
                s.push(c)
            } else {
                if s.isEmpty {
                    return false
                }
                let charPoppedFromStack = s.pop()
                let openingIndex = self.opening.index(of: charPoppedFromStack!)!
                let closingIndex = self.closing.index(of: c)!
                
                if openingIndex != closingIndex {
                    return false
                }
            }
        }
        return s.isEmpty
    }
}

let m1 = Matcher(string: "()(()){([()])}")
assert(m1.check(), "This should match")

let m2 = Matcher(string: "((()(()){([()])}))")
assert(m2.check(), "This should match")

let m3 = Matcher(string: ")(()){([()])}")
assert(!m3.check(), "This NOT should match")

let m4 = Matcher(string: "({[])}")
assert(!m4.check(), "This NOT should match")



