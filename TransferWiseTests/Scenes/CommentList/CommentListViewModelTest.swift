//
//  CommentListViewModelTest.swift
//  TransferWiseTests
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import XCTest
@testable import TransferWise

class CommentListViewModelTest: XCTestCase {
    
  var store: DummyStore?
  var apiClient: DummyEndPoint?
  var selectedPost: PostType?
  override func setUp() {
    super.setUp()
    store = DummyStore()
    apiClient = DummyEndPoint()
    selectedPost = store?.posts[0]
  }
  
  override func tearDown() {
    super.tearDown()
    store = nil
    apiClient = nil
    selectedPost = nil
  }
  
  func testCommentsLoad() {
    let commentViewModel = CommentListViewModel(apiClient: apiClient!, store: store!, post: selectedPost!)
    let expectation = self.expectation(description: "LoadingComments")
    commentViewModel.loadComments {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 0.5, handler: nil)
    let comments = store?.comments.filter { comment -> Bool in
      comment.postId == selectedPost?.id
    }
    XCTAssertEqual(commentViewModel.numberOfComments(), comments?.count)
    guard let comment = comments?.last else {
      return
    }
    XCTAssertEqual(comment.postId, selectedPost?.id)
  }
    
}
