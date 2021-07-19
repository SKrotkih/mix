//
//  Router.swift
//  TestRouter
//

import Foundation

class Router {

    let f1, f2, f3: () -> ()

    enum Router: Int {
        case state1 = 1
        case state2 = 2
        case state3 = 5
    }
    
    enum MyError: Error {
        case parameterIsWrong
        case unexpected
        case message(String)

        func description() -> String {
            switch self {
            case .parameterIsWrong:
                return "Parameter is wrong"
            case .unexpected:
                return "Unexpected error has occured"
            case .message(let text):
                return text
            }
        }
    }
    
    let print: (String) -> () -> () = { string in
        { Swift.print(string) }
    }

    init() {
        f1 = print("f1")
        f2 = print("f2")
        f3 = print("f3")
    }

    func route(_ router: Router) -> () -> () {
        switch router {
        case .state1:
            return f1
        case .state2:
            return f2
        case .state3:
            return f3
        }
    }

    func mySolution(state: Router) {
        route(state)()
    }

    func mySolution(value: Int) throws {
        guard let router = Router(rawValue: value) else {
            throw MyError.message("Parameter \(value) is unacceptable")
        }
        route(router)()
    }

    func test() {
        mySolution(state: .state1)
        mySolution(state: .state2)
        mySolution(state: .state3)

        for value in 0..<10 {
            do {
                try mySolution(value: value)
            } catch MyError.message(let text) {
                Swift.print(text)
            } catch {
                Swift.print((error as? MyError)?.description() ?? "\(error)")
            }
        }
    }
}
