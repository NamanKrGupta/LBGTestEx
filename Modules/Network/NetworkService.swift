import Foundation

protocol NetworkServicing {
    func fetchPosts() async throws -> [Post]
}

final class NetworkService: NetworkServicing {
    func fetchPosts() async throws -> [Post] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Post].self, from: data)
    }
}

