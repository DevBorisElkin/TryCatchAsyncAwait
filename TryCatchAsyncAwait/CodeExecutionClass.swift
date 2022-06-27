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

func executeSomeCode(){
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
}

// can type throws {} or throws -> Void or thows -> ()
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
