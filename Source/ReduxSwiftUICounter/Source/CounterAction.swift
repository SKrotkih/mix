//
//  CounterAction.swift
//  ReduxSwiftUICounter
//

import Foundation

// Action: Actions are payloads or simply objects of information,
// that captures from the application via any kind of events such as
// touch events, network API responses etc,.
enum CounterAction: ReduxAction {
    case increase
    case decrease
}
