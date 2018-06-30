//
//  Post.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

protocol PostType {
  var id: Int { get }
  var title: String { get }
  var body: String { get }
}

extension Post {
  init(realmPost: RealmPost) {
    self.init(id: realmPost.ID, title: realmPost.title, body: realmPost.body)
  }
}

extension Post: PostType {}
