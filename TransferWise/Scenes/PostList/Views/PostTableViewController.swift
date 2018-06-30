//
//  PostTableViewController.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {

  var viewModel: PostTableViewModelType?
  let errorView = ErrorView()
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    self.title = "Posts"
    self.clearsSelectionOnViewWillAppear = true
    tableView.estimatedRowHeight = tableView.rowHeight
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.backgroundView = errorView
    viewModel?.loadPosts {
      [weak self] in
      self?.tableView.reloadData()
    }
  }
  
  // MARK: - TableViewDatasource
  override func numberOfSections(in tableView: UITableView) -> Int {
    return viewModel?.numberOfPosts() ?? 0
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
    
    let postViewModel = viewModel?.postAt(index: indexPath.section)
    cell.viewModel = postViewModel
    return cell
  }
  
  //MARK:- TableViewDelegate
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 3.0
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return UIView()
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel?.didSelectAt(index: indexPath.section)
  }
}

extension PostTableViewController: PostTableViewModelDelegate {
  
  func showError(image: UIImage?, message: String) {
    errorView.message = message
    errorView.image = image
    errorView.alpha = 1
  }
  
  func hideError() {
    errorView.alpha = 0
  }
  
}

