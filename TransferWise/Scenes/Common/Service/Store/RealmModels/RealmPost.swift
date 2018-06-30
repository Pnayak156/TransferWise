//
//  RealmPost.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation
import RealmSwift

final class RealmPost: Object {
  @objc dynamic var ID = 0
  @objc dynamic var title = ""
  @objc dynamic var body = ""
  
  override static func primaryKey() -> String? {
    return "ID"
  }
  
  convenience init(post: PostType) {
    self.init()
    ID = post.id
    title = post.title
    body = post.body
  }
}



