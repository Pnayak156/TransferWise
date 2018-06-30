//
//  APIClientType.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

enum Result<T> {
  case success(T)
  case error(String)
}

protocol APIClientType {
  func postRequest(_ completionHandler: @escaping (Result<[Post]>) -> Void) -> Void
  func commentsRequestFor(postId: Int, completionHandler: @escaping (Result<[Comment]>) -> Void) -> Void
  
}
