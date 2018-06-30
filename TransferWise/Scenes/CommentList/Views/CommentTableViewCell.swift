//
//  CommentTableViewCell.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import UIKit

final class CommentTableViewCell: UITableViewCell {
  static let identifier = "CommentCellIdentifier"
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel!
  
  var viewModel: CommentViewModelType! {
    didSet {
      updateUI()
    }
  }
}

// MARK:- Updating UI
extension CommentTableViewCell {
  private func updateUI() {
    nameLabel.text = viewModel.name
    emailLabel.text = viewModel.email
    bodyLabel.text = viewModel.body
  }
}
