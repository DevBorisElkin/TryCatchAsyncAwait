//
//  CodeExecutionAsyncAwait.swift
//  TryCatchAsyncAwait
//
//  Created by test on 28.06.2022.
//

import Foundation

class Vegetable{
    let id: Int
    var alreadyChopped = false

    init(id: Int){
        self.id = id
    }
    
    func chopVegetable() async -> Vegetable{
        print("Vegetable \(id) is starting to get chopped")
        alreadyChopped = true
        Thread.sleep(forTimeInterval: 2)
        print("Vegetable \(id) finally got chopped")
        return self
    }
}

func gatherRawVeggies() -> [Vegetable]{
    [Vegetable(id: 1), Vegetable(id: 2), Vegetable(id: 3)]
}

func chopVegetables() async -> [Vegetable]{
    let rawVeggies = gatherRawVeggies()
    var choppedVeggies = [Vegetable]()
    
    for rawVegetable in rawVeggies{
        choppedVeggies.append( await rawVegetable.chopVegetable())
    }
    return choppedVeggies
}

// check this https://www.youtube.com/watch?v=SedBsBo5mhA&ab_channel=SwiftBook
// unfortunately deprecated code, but it's worth studying
//public func executeSomeAsyncCode(){
//    async{
//        let veggies = try await chopVegetables()
//        for veggie in veggies {
//            print("Vegetable[\(veggie.id)] is chopped[\(veggie.alreadyChopped)]")
//        }
//    }
//}

public func executeSomeAsyncCode() {
    testFunc()
}

private func testFunc(){
    Task{
        let veggies = await chopVegetables()
        for veggie in veggies {
            print("Vegetable[\(veggie.id)] is chopped[\(veggie.alreadyChopped)]")
        }
    }
}
