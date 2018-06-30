//
//  PostTableViewModel.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import UIKit

protocol PostTableViewModelCoordinatorDelegate: class {
  func goToCommentsFor(post: PostType) -> Void
}


final class PostTableViewModel {
  private let apiClient: APIClientType
  private var posts: [PostType] = []
  private let store: StoreType
  private var postLoadCompletionHandler: PostLoadCompletion?
  weak var delegate: PostTableViewModelDelegate?
  weak var coordinatorDelegate: PostTableViewModelCoordinatorDelegate?
  
  init(apiClient: APIClientType, store: StoreType) {
    self.apiClient = apiClient
    self.store = store
  }
  
  private func refresh() {
    DispatchQueue.main.async {
      [weak self] in
      if let strongSelf = self {
        strongSelf.postLoadCompletionHandler?()
        self?.handleError()
      }
    }
  }
}

//MARL:- PostTableViewModelType
extension PostTableViewModel: PostTableViewModelType {
  func loadPosts(_ completionHandler: @escaping PostLoadCompletion) {
    postLoadCompletionHandler = completionHandler
    fetchPosts { [weak self] posts in
      guard posts.count > 0 else {
        self?.makePostRequest()
        return
      }
      self?.posts = posts
      self?.refresh()
    }
  }
  
  func numberOfPosts() -> Int {
    return self.posts.count
  }
  
  func postAt(index: Int) -> PostViewModelType {
    return PostViewModel.init(post: self.posts[index])
  }
  
  func didSelectAt(index: Int) {
    coordinatorDelegate?.goToCommentsFor(post: self.posts[index])
  }
  
}


//MARK:- CRUD
extension PostTableViewModel {
  private func storePosts(_ posts: [PostType]) {
    store.storePosts(posts)
  }
  
  private func fetchPosts(_ completion: @escaping ([PostType]) -> Void) {
    store.fetchPosts(completionHandler: completion)
  }
}

//MARK:- Network
extension PostTableViewModel {
  private func makePostRequest() {
    makePostRequest { [weak self] (posts) in
      if let posts = posts {
        self?.posts = posts
        self?.storePosts(posts)
      }
      self?.refresh()
    }
  }
  
  private func makePostRequest(_ completion: @escaping ([PostType]?) -> Void) {
    apiClient.postRequest { result in
      switch result {
      case .success(let posts):
        completion(posts)
      case .error(_):
        completion(nil)
      }
    }
  }
}

//MARK:- Error handling
extension PostTableViewModel {
  private func handleError() {
    guard self.posts.count == 0 else {
      self.delegate?.hideError()
      return
    }
    let reach = Reach()
    if reach.isConnected() {
      showNoPostsState()
    } else {
      showOfflineState()
    }
  }
  
  private func showOfflineState() {
    self.delegate?.showError(image: UIImage(named: "noInternet"),
                             message: "You are not connected to internet")
  }
  
  private func showNoPostsState() {
    self.delegate?.showError(image: UIImage(named: "noPosts"),
                             message: "There are no posts for you")
  }
}
