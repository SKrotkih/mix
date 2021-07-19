//
//  CounterView.swift
//  ReduxSwiftUICounter
//

import Foundation
import SwiftUI

// View: View subscribes to the state changes from the store.
struct CounterView: View {
    @EnvironmentObject var store: AppStore

    var body: some View {
        VStack {
            Text("\(store.state.counterState.count)")
                .padding()
            HStack {
                Button("Increase") {
                    self.store.dispatch(CounterAction.increase)
                }

                Button("Decrease") {
                    self.store.dispatch(CounterAction.decrease)
                }
            }
        }
    }
}
