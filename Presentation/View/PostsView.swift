import SwiftUI

struct PostsView: View {
    @StateObject private var viewModel: PostsViewModel

    init(viewModel: PostsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                } else {
                    List(viewModel.posts) { post in
                        VStack(alignment: .leading) {
                            Text(post.title).font(.headline)
                            Text(post.body).font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Posts")
        }
        .onAppear {
            Task {
                await viewModel.loadPosts()
            }
        }
    }
}
