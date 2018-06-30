//
//  PostListCoordinator.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import UIKit

final class PostListCoordinator: Coordinator {
  private static let storyboardName = "PostList"
  private let apiClient: APIClientType
  private let store: StoreType
  private let navigationController: UINavigationController
  private let storyBoard = UIStoryboard(name: storyboardName,
                                        bundle: nil)
  
  private lazy var rootViewController: PostTableViewController = {
    return storyBoard.instantiateInitialViewController() as! PostTableViewController
  }()
  
  private lazy var viewModel: PostTableViewModelType =  {
    let viewModel = PostTableViewModel.init(apiClient: apiClient,
                                            store: store)
    viewModel.delegate = rootViewController
    viewModel.coordinatorDelegate = self
    return viewModel
  }()
  
  init(navigationController: UINavigationController,
       apiClient: APIClientType,
       store: StoreType) {
    self.navigationController = navigationController
    self.apiClient = apiClient
    self.store = store
  }
  
  override func start() {
    rootViewController.viewModel = viewModel
    navigationController.viewControllers = [rootViewController]
  }
  
  override func finish() {
    //TODO
  }
}


//MARK:- CommentsCoordinatorDelegate
extension PostListCoordinator: CommentListCoordinatorDelegate {
  func didFinish(_ coordinator: CommentListCoordinator) {
    removeChildCoordinator(coordinator)
  }
}

//MARK:- PostTableViewModelCoordinatorDelegate
extension PostListCoordinator: PostTableViewModelCoordinatorDelegate {
  func goToCommentsFor(post: PostType) {
    let commentsCoordinator = CommentListCoordinator(from: navigationController,
                                                  post: post,
                                                  apiClient: apiClient,
                                                  store: store)
    commentsCoordinator.delegate = self
    addChildCoordinator(commentsCoordinator)
    commentsCoordinator.start()
  }
}
