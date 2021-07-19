//
//  ReduxReducer.swift
//  ReduxSwiftUICounter
//

import Foundation

public protocol ReduxReducer {
    associatedtype State: ReduxState

    func reduce(state: State?, action: ReduxAction?) -> State
}
