//
//  CommentListCoordinator.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import UIKit

protocol CommentListCoordinatorDelegate: class {
  func didFinish(_ coordinator: CommentListCoordinator) -> Void
}

final class CommentListCoordinator: Coordinator {
  private static let storyboardName = "CommentList"
  private let fromViewController: UIViewController
  weak var delegate: CommentListCoordinatorDelegate?
  private let storyBoard = UIStoryboard(name: storyboardName , bundle: nil)
  private let apiClient: APIClientType
  private let store: StoreType
  private let post: PostType
  
  private lazy var commentListViewController: CommentListViewController = {
    return storyBoard.instantiateInitialViewController() as! CommentListViewController
  }()
  
  private lazy var viewModel: CommentListViewModelType = {
    let vm = CommentListViewModel(apiClient: apiClient, store: store, post: post)
    vm.delegate = commentListViewController
    return vm
  }()
  
  init(from: UIViewController, post: PostType, apiClient: APIClientType, store: StoreType) {
    fromViewController = from
    self.post = post
    self.apiClient = apiClient
    self.store = store
  }
  
  override func start() {
    if let navVC = fromViewController as? UINavigationController {
      navVC.delegate = self
    }
    commentListViewController.viewModel = viewModel
    
    showViewController(commentListViewController, from: fromViewController, animated: true)
  }
  
  override func finish() {
    delegate?.didFinish(self)
  }
}

//MARK:- UINavigationControllerDelegate
extension CommentListCoordinator: UINavigationControllerDelegate {
  func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
    guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
      !navigationController.viewControllers.contains(fromViewController) else {
        return
    }
    
    if fromViewController is CommentListViewController {
      finish()
    }
  }
}
