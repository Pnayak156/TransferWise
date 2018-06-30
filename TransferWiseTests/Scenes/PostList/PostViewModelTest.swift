//
//  PostViewModelTest.swift
//  TransferWiseTests
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import XCTest
@testable import TransferWise

class PostViewModelTest: XCTestCase {
    
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testPost() {
    let post = Post(id: 1, title: "Test Title", body: "Test Body")
    let postViewModel = PostViewModel(post: post)
    
    XCTAssertEqual("Test Body", postViewModel.body)
    XCTAssertEqual("Test Title", postViewModel.title)
    
  }
    
}
