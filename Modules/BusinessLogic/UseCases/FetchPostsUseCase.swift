protocol FetchPostsUseCase {
    func execute() async throws -> [Post]
}

final class DefaultFetchPostsUseCase: FetchPostsUseCase {
    private let networkService: NetworkServicing

    init(networkService: NetworkServicing) {
        self.networkService = networkService
    }

    func execute() async throws -> [Post] {
        return try await networkService.fetchPosts()
    }
}
