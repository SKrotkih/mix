//
//  ReduxStore.swift
//  ReduxSwiftUICounter
//

import Foundation

public protocol ReduxStore: ObservableObject {
    associatedtype State: ReduxState

    var state: State { get }

    func dispatch(_ action: ReduxAction)
}
