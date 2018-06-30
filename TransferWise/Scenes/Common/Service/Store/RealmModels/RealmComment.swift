//
//  RealmComment.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmComment: Object {
  @objc dynamic var postId = 0
  @objc dynamic var ID = 0
  @objc dynamic var name = ""
  @objc dynamic var email = ""
  @objc dynamic var body = ""
  
  override static func primaryKey() -> String? {
    return "ID"
  }
  
  convenience init(comment: CommentType) {
    self.init()
    ID = comment.id
    postId = comment.postId
    name = comment.name
    email = comment.email
    body = comment.body
  }
}
