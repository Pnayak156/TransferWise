//
//  CommentType.swift
//  TransferWise
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

protocol CommentType {
  var id: Int { get }
  var postId: Int { get }
  var name: String { get }
  var email: String { get }
  var body: String { get }
}
