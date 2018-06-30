//
//  DummyData.swift
//  TransferWiseTests
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import Foundation

@testable import TransferWise
enum DummyData {
  
  static let posts: [Post] = [
    Post(id: 1, title: "Title1", body: "Body1"),
    Post(id: 2, title: "Title2", body: "Bpdy2")
  ]
  
  static let comments: [Comment] = [
    Comment(id: 1,
            postId: 1,
            email: "test@email",
            body: "testbody",
            name: "testName"),
    Comment(id: 2,
            postId: 1,
            email: "test@email1",
            body: "testbody1",
            name: "testName1"),
    Comment(id: 3,
            postId: 2,
            email: "test@email2",
            body: "testbody2",
            name: "testName2"),
    Comment(id: 4,
            postId: 2,
            email: "test@email3",
            body: "testbody3",
            name: "testName3")
  ]
  
}
