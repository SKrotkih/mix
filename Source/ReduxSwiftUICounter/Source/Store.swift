//
//  Store.swift
//  ReduxSwiftUICounter
//

import Foundation
import SwiftUI

//
// Store: Store holds the state. Store receives the action and passes on to the reducer
// and gets the updated state and passes on to the subscribers.
// It is important to note that you will only have a single store in an application.
// If you want to split your data handling logic,
// you will use reducer composition i.e using many reducers instead of many stores.
//
// Example:
// private let store: AppStore = Store(initialState: AppState(counterState: .initialState),
//                                     rootReducer: RootReducer(counterReducer: .init()))
//
open class Store<AppState, RootReducer>: ReduxStore where RootReducer: ReduxReducer,
      RootReducer.State == AppState
{
    @Published private(set) public var state: AppState
    private let rootReducer: RootReducer

    init(initialState: AppState, rootReducer: RootReducer) {
        self.state = initialState
        self.rootReducer = rootReducer
    }
    
    public func dispatch(_ action: ReduxAction) {
        state = rootReducer.reduce(state: state,
                                   action: action)
    }
}
