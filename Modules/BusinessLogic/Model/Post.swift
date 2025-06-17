import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
