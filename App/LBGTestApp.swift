import SwiftUI

@main
struct LBGTest: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            let networkService = NetworkService()
            let useCase = DefaultFetchPostsUseCase(networkService: networkService)
            let viewModel = PostsViewModel(fetchPostsUseCase: useCase)
            PostsView(viewModel: viewModel)
        }
    }
}
