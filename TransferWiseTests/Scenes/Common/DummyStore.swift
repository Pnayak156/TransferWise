//
//  DummyStore.swift
//  TransferWiseTests
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation
@testable import TransferWise

class DummyStore: StoreType {
  
  lazy var comments: [CommentType] = {
    return DummyData.comments
  }()
  
  lazy var posts: [PostType] = {
    return DummyData.posts
  }()
  
  func storePosts(_ posts: [PostType]) {
    //Do nothing for now
  }
  
  func fetchPosts(completionHandler: @escaping ([PostType]) -> Void) {
    completionHandler(posts)
  }
  
  func storeComments(_ comments: [CommentType]) {
    //Do nothing for now
  }
  
  func fetchCommentsFor(postId: Int, completionHandler: @escaping ([CommentType]) -> Void) {
    completionHandler(comments.filter { comment -> Bool in
      return comment.postId == postId
    })
  }
  
}
