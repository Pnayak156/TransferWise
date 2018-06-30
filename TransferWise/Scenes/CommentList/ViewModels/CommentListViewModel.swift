//
//  CommentListViewModel.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

import UIKit

final class CommentListViewModel {
  private let apiClient: APIClientType
  private let store: StoreType
  private let post: PostType
  private var comments: [CommentType] = []
  private var commentLoadCompletionHandler: CommentLoadCompletion?
  weak var delegate: CommentListViewModelDelegate?
  
  init(apiClient: APIClientType, store: StoreType, post: PostType) {
    self.apiClient = apiClient
    self.store = store
    self.post = post
  }
  
  private func refresh() {
    DispatchQueue.main.async {
      [weak self] in
      guard let strongSelf = self else {
        return
      }
      strongSelf.commentLoadCompletionHandler?()
      self?.handleError()
    }
  }
}

//MARK:- CommentsTableViewModelType
extension CommentListViewModel: CommentListViewModelType {
  func numberOfComments() -> Int {
    return comments.count
  }
  
  func commentAtIndex(_ index: Int) -> CommentViewModelType {
    return CommentViewModel(comment: comments[index])
  }
  
  func loadComments(_ completionHandler: @escaping CommentLoadCompletion) {
    commentLoadCompletionHandler = completionHandler
    fetchCommentsFor(postId: post.id) { comments in
      guard comments.count > 0 else {
        self.makeCommentsRequest(for: self.post.id)
        return
      }
      self.comments = comments
      self.refresh()
    }
  }
}

//MARK:- CRUD
extension CommentListViewModel {
  private func storeComments(comments: [CommentType]) {
    self.store.storeComments(comments)
  }
  
  private func fetchCommentsFor(postId: Int, completionHandler: @escaping ([CommentType]) ->Void)  {
    self.store.fetchCommentsFor(postId: postId, completionHandler: completionHandler)
  }
}

//MARK:- Network
extension CommentListViewModel {
  
  private func makeCommentsRequest(for postId: Int) {
    makeCommentsRequestFor(postId: postId) {
      [weak self] comments in
      if let comments = comments {
        self?.comments = comments
        self?.storeComments(comments: comments)
      }
      self?.refresh()
    }
  }
  
  private func makeCommentsRequestFor(postId: Int, completion: @escaping ([CommentType]?) -> Void) {
    self.apiClient.commentsRequestFor(postId: postId) {
      result in
      switch result {
      case .success(let comments):
        completion(comments)
      case .error(_):
        completion(nil)
      }
    }
  }
}

//MARK:- Error handling
extension CommentListViewModel {
  private func handleError() {
    guard self.comments.count == 0 else {
      self.delegate?.hideError()
      return
    }
    let reach = Reach()
    if reach.isConnected() {
      showNoCommentsState()
    } else {
      showOfflineState()
    }
  }
  
  private func showOfflineState() {
    self.delegate?.showError(image: UIImage(named: "noInternet"), message: "You are not connected to internet")
  }
  
  private func showNoCommentsState() {
    self.delegate?.showError(image: UIImage(named: "noPosts"), message: "There are no comments for this post")
  }
}
