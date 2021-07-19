//
//  RootReducer.swift
//  ReduxSwiftUICounter
//

import Foundation

// Reducer: A Reducer is a function that takes the current state from the store, and the action.
// It combines the action and current state together and returns the new state
struct RootReducer: ReduxReducer {
    let counterReducer: CounterReducer
    
    func reduce(state: AppState?, action: ReduxAction?) -> AppState {
        return AppState(counterState: counterReducer.reduce(state: state?.counterState,
                                                            action: action))
    }
}
