//
//  CodeExecutionClass.swift
//  TryCatchAsyncAwait
//
//  Created by test on 27.06.2022.
//

import Foundation

enum CustomError : Error{
    case DivisionByZero
    case NegativeNumbers
    case IDontLikeDrivingAround
}

// good link
// https://www.youtube.com/watch?v=Lrc-MX8WgNc&ab_channel=SeanAllen

// we can also use try! and try? without do-try-catch block
// try! will crash app if there's exception, or we will get the value that function returns
// try? will get us optional value and it will be 'nil' or 'value' depending on whether function
// threw exception or successfully retrieved the value

// that's how you can use 'try' without do-try-catch block
// var someData : Int? = try? calculateDidision(4, 0) // divide 4 by 0
// var someData : Int = try! calculateDidision(4, 2) // divide 4 by 2

func executeSomeCodeWithErrors(){
    do{
        let imageData = try Data(contentsOf: URL(fileURLWithPath: "myFilePath"))
        // it's safe, code below will execute
    }catch{
        //Handle the error
        // Show popup with the error
        print(error)
    }
    
    print("We're good to go")
    
    do{
        try divideNumber(initialNumber: 4, divideBy: 0)
    }catch{
        print(error)
    }
    print("We're good to go 2")
    
    do{
        try divideNumber(initialNumber: -4, divideBy: 2)
    }catch{
        print(error)
    }
    print("We're good to go 3")
    
    var divisionResult = 0
    do{
        divisionResult = try divideNumber(initialNumber: 10, divideBy: 5)
    }catch{
        print(error)
    }
    print("We're good to go, division result \(divisionResult)")
    
    //
    
    do{
        divisionResult = try divideNumber(initialNumber: 10, divideBy: 0)
    }catch CustomError.DivisionByZero{
        // do something with error
        print("the error is \(CustomError.DivisionByZero)")
    }catch CustomError.NegativeNumbers{
        // do something with error
        print("the error is \(CustomError.NegativeNumbers)")
    }catch CustomError.IDontLikeDrivingAround{
        // do something with error
        print("the error is \(CustomError.IDontLikeDrivingAround)")
    }catch{ // THIS IS IN CASE OF A DIFFERENT ERROR THAT HAS NOT BEET COVERED ABOVE
        // do something with error
        print("the error is \(error)")
    }
}

// can type
// func functionName() throws {}
// func functionName() throws -> Void{}
// func functionName() thows -> ()
//private func throwSomeError() throws -> Void{
//    throw exception
//}

private func divideNumber(initialNumber: Int, divideBy : Int) throws -> Int{
    
    if(divideBy == 0){
        throw CustomError.DivisionByZero
    }
    
    if(initialNumber < 0 || divideBy < 0){
        throw CustomError.NegativeNumbers
    }
    
    return initialNumber / divideBy
}


// learning 'defer' blocks

// 'defer actions' or 'defer blocks' allow you to execute some code after leaving
// the scope where those blocks were declared

// multiple defer block are executed from bottom to top, meaning the example below will
// multiply 0 by 2 and then add to it 2, resulting in 2



var attemptsCount = 0
func tryDeferBlocks(){
    deferBlocksInAction(someInt: 4)
    print("attempsCount: \(attemptsCount)")
}

func deferBlocksInAction(someInt: Int){
    defer{
        attemptsCount += 2
    }
    
    defer{
        attemptsCount *= 2
    }
    
    if(someInt == 3){
        print("Three")
    }else{
        print("OtherValue")
    }
}
