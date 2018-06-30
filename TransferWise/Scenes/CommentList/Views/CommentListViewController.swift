//
//  CommentListViewController.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import UIKit

final class CommentListViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var viewModel: CommentListViewModelType?
  private let errorView = ErrorView()
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Comments"
    tableView.backgroundView = errorView
    tableView.estimatedRowHeight = tableView.rowHeight
    tableView.rowHeight = UITableViewAutomaticDimension
    viewModel?.loadComments {
      [weak self] in
      self?.tableView.reloadData()
    }
  }
}

//MARK:- UITableViewDataSource
extension CommentListViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel?.numberOfComments() ?? 0
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as! CommentTableViewCell
    let cellViewModel = viewModel?.commentAtIndex(indexPath.section)
    cell.viewModel = cellViewModel
    return cell
  }
}

//MARK:- UITableViewDelegate
extension CommentListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 3.0
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return UIView()
  }
}

//MARK:- CommentsTableViewModelDelegate
extension CommentListViewController: CommentListViewModelDelegate {
  func showError(image: UIImage?, message: String) {
    errorView.message = message
    errorView.image = image
    errorView.alpha = 1
  }
  
  func hideError() {
    errorView.alpha = 0
  }
}
