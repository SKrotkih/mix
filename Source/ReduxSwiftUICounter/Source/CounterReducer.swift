//
//  CounterReducer.swift
//  ReduxSwiftUICounter
//

import Foundation

struct CounterReducer: ReduxReducer {
    func reduce(state: CounterState?, action: ReduxAction?) -> CounterState {
        let currentState = state ?? CounterState.initialState
        guard let action = action as? CounterAction else {
            return currentState
        }
        switch action {
        case .increase:
            return increaseCounter(for: currentState)
        case .decrease:
            return decreaseCounter(for: currentState)
        }
    }
    
    private func increaseCounter(for state: CounterState) -> CounterState {
        CounterState(count: state.count + 1)
    }
    
    private func decreaseCounter(for state: CounterState) -> CounterState {
        CounterState(count: state.count - 1)
    }
}
