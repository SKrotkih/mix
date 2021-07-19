//
//  Utility.swift
//  CombineExample
//
//  Created by Sergey Krotkih on 15.11.2022.
//
import Foundation
import Combine

struct Utility {
    static func test() {
        testLCM()
    }
    
    static func testLCM() {
        leastCommonMultiple(divisor1: 3, divisor2: 5)
            .sink { array in
                print(array, separator: ", ")
            }
    }
    
    // Test task on the job interview
    // Compute least common multiple of divisor1 and divisor2 for numbers from 1 to 100
    static func leastCommonMultiple(divisor1: Int, divisor2: Int) -> AnyPublisher<[Int], Never> {
        return Future<[Int], Never> { promise in
            (1...100)
                .publisher
                .map { number in
                    (number % divisor1 == 0 && number % divisor2 == 0) ? number : nil
                }
                .compactMap { $0 }
                .collect()
                .sink {
                    promise(.success($0))
                }
        }.eraseToAnyPublisher()
    }
}


// Example from Medium. https://betterprogramming.pub/swiftui-architecture-a-complete-guide-to-mv-pattern-approach-5f411eaaaf9e

class Order: Identifiable, Codable {
    let id: String?
    let name: String
}

enum OrderServiceError: Error {
    case badURL
}

class OrderService {
    
    let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func getAllOrders() async throws -> [Order] {
        
        guard let url = URL(string: "/orders", relativeTo: baseURL) else {
            throw OrderServiceError.badURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Order].self, from: data)
    }
    
    func placeOrder(_ order: Order) async throws -> Order? {
        
        guard let url = URL(string: "/newOrder", relativeTo: baseURL) else {
            throw OrderServiceError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(order)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let savedOrder = try JSONDecoder().decode(Order.self, from: data)
        
        return savedOrder
    }
    
    func updateOrder(_ order: Order) async throws -> Order? {
        
        guard let url = URL(string: "/orders/\(order.id!)", relativeTo: baseURL) else {
            throw OrderServiceError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(order)
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let updatedOrder = try JSONDecoder().decode(Order.self, from: data)
        
        return  updatedOrder
    }
    
}
