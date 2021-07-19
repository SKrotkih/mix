//
//  ReduxSwiftUICounterApp.swift
//  ReduxSwiftUICounter
//

import SwiftUI

typealias AppStore = Store<AppState, RootReducer>

@main
struct ReduxSwiftUICounterApp: App {
    private let store: AppStore = Store(initialState: AppState(counterState: .initialState),
                                        rootReducer: RootReducer(counterReducer: .init()))
    
    var body: some Scene {
        WindowGroup {
            CounterView().environmentObject(store)
        }
    }
}
