//
//  main.swift
//  for vs reduce
//
//  Created by 김승진 on 2021/08/23.
//

import Foundation

var array = [Float](repeating: 0, count: 1_000_000)
for i in 0..<array.count {
    array[i] = Float.random(in: 0 ... 1_000)
}
print("generated array!!")
func reduce() {
    print(#function)
    // Perform operation 100,000 times
    let start = DispatchTime.now()
    var sum: Float = 0
//    for _ in 0 ..< 100 { // hard test
        sum = array.reduce(0, { $0 + $1 })
//    }
    // Log the elapsed time
    let end = DispatchTime.now()   // <<<<<<<<<<   end time
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
    let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
    print("reduce timeInterval : \(timeInterval), sum :\(sum)")
}

func `for`() {
    print(#function)
    let start = DispatchTime.now()
    var sum: Float = 0
//    for _ in 0 ..< 100 { // hard test
        for element in array {
            sum += element
        }
//    }
    // Log the elapsed time
    let end = DispatchTime.now()   // <<<<<<<<<<   end time
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
    let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
    print("for timeInterval : \(timeInterval), sum :\(sum)")
}

func map() {
    print(#function)
    // Perform operation 100,000 times
    let start = DispatchTime.now()
    var sum: Float = 0
//    for _ in 0 ..< 100 { // hard test
        sum = array.reduce(0, { $0 + $1 })
//    }
    // Log the elapsed time
    let end = DispatchTime.now()   // <<<<<<<<<<   end time
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
    let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
    print("reduce timeInterval : \(timeInterval), sum :\(sum)")
}

reduce()
`for`()
