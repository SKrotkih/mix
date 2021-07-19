//
//  CounterState.swift
//  ReduxSwiftUICounter
//

import Foundation

// State: Based on your state you render your UI or respond in any form.
// So basically state refers to the source of truth.
struct CounterState: ReduxState {
    static var initialState: CounterState {
        .init(count: 0)
    }

    let count: Int
}
