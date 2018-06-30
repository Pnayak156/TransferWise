//
//  CommentViewModel.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

class CommentViewModel: CommentViewModelType {
  var name: String
  var email: String
  var body: String
  init(comment: CommentType) {
    name = comment.name
    email = comment.email
    body = comment.body
  }
}
