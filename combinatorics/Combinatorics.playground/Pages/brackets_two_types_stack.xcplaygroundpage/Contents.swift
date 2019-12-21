//: [Previous](@previous)

import Foundation
import UIKit

class Stack<T> {
    var items = [T] ()

    func push(item: T) {
        items.append(item)
    }

    func pop() -> T? {
        return items.popLast()
    }
    
    func peek() -> T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
}

let N = 3
var n = 2 * N

var a = [String] (repeating: "1", count: n)
var stack = Stack<String> ()

var lineNumber = 1

func print_variant() {
    print("\(lineNumber): \(a)")
    lineNumber += 1
}

func rec(idx: Int, stack: Stack<String>) {
    
    if idx >= n {
        if stack.isEmpty() {
            print_variant()
        }
        return
    }
    
    a[idx] = "("
    stack.push(item: "(")
    rec(idx: idx + 1, stack: stack)
    stack.pop()
    
    if !stack.isEmpty() {
        if stack.peek() == "(" {
            a[idx] = ")"
            stack.pop()
            rec(idx: idx + 1, stack: stack)
            stack.push(item: "(")
        }
    }
    
    a[idx] = "["
    stack.push(item: "[")
    rec(idx: idx + 1, stack: stack)
    stack.pop()

    if !stack.isEmpty() {
        if stack.peek() == "[" {
            a[idx] = "]"
            stack.pop()
            rec(idx: idx + 1, stack: stack)
            stack.push(item: "[")
        }
    }
}

rec(idx: 0, stack: stack)

//: [Next](@next)
