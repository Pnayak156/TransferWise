//
//  PostTableViewModelType.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

typealias PostLoadCompletion = () -> Void
protocol PostTableViewModelType {
  func loadPosts(_ completionHandler: @escaping PostLoadCompletion) -> Void
  func numberOfPosts() -> Int
  func postAt(index: Int) -> PostViewModelType
  func didSelectAt(index: Int) -> Void
}
