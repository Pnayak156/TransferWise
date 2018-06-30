//
//  Comment.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

struct Comment: Codable {
  let id: Int
  let postId: Int
  let email: String
  let body: String
  let name: String
}

extension Comment {
  init(realmComment: RealmComment) {
    self.init(id:  realmComment.ID,
              postId: realmComment.postId,
              email: realmComment.email,
              body: realmComment.body,
              name: realmComment.name)
  }
}

extension Comment: CommentType {}
