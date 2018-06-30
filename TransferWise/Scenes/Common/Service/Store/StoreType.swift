//
//  StoreType.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

protocol StoreType {
  func storePosts(_ posts:[PostType])
  func fetchPosts(completionHandler: @escaping ([PostType]) -> Void)
  func storeComments(_ comments: [CommentType])
  func fetchCommentsFor(postId: Int, completionHandler: @escaping ([CommentType]) -> Void)
}
