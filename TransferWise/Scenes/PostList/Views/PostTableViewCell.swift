//
//  PostTableViewCell.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  static let identifier = "PostCellIdentifier"
  @IBOutlet weak var bodyLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  
  var viewModel: PostViewModelType! {
    didSet {
      updateUI()
    }
  }
  
}

// MARK:- Updating UI
extension PostTableViewCell {
  private func updateUI() {
    titleLabel.text = viewModel.title
    bodyLabel.text = viewModel.body
  }
}
