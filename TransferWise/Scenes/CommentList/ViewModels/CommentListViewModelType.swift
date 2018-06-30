//
//  CommentListViewModelType.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

typealias CommentLoadCompletion = () -> Void
protocol CommentListViewModelType {
  func numberOfComments() -> Int
  func commentAtIndex(_ index: Int) -> CommentViewModelType
  func loadComments(_ completionHandler: @escaping CommentLoadCompletion) -> Void
}
