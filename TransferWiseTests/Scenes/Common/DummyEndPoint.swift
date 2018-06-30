//
//  DummyEndPoint.swift
//  TransferWiseTests
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation
@testable import TransferWise

class DummyEndPoint: APIClientType {
  
  lazy var comments: [Comment] = {
    return DummyData.comments
  }()
  
  lazy var posts: [Post] = {
    return DummyData.posts
  }()
  
  func postRequest(_ completionHandler: @escaping (Result<[Post]>) -> Void) {
    completionHandler(.success(posts))
  }
  
  func commentsRequestFor(postId: Int, completionHandler: @escaping (Result<[Comment]>) -> Void) {
    let commentsForPost = comments.filter { comment -> Bool in
      return comment.postId == postId
    }
    completionHandler(.success(commentsForPost))
  }
}
