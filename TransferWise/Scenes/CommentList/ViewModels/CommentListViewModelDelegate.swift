//
//  CommentListViewModelDelegate.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import UIKit

protocol CommentListViewModelDelegate: class {
  func showError(image: UIImage?, message: String) -> Void
  func hideError() -> Void
}
