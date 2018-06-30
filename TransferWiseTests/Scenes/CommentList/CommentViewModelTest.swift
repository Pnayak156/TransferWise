//
//  CommentViewModelTest.swift
//  TransferWiseTests
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import XCTest
@testable import TransferWise
class CommentViewModelTest: XCTestCase {
    
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testComment() {
    let comment = Comment(id: 1, postId: 2, email: "test@email", body: "test body", name: "test name")
    let viewModel = CommentViewModel(comment: comment)
    
    XCTAssertEqual("test body", viewModel.body)
    XCTAssertEqual("test@email", viewModel.email)
    XCTAssertEqual("test name", viewModel.name)
  }
    
}
