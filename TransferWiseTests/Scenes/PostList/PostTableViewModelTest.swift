//
//  PostListViewModelTest.swift
//  TransferWiseTests
//
//  Created by Prashant Kumar Nayak on 26/06/18.
//  Copyright © 2018 Prashant Kumar Nayak. All rights reserved.
//

import XCTest
@testable import TransferWise

class DummyCoordinator: PostTableViewModelCoordinatorDelegate {
  typealias completion = (PostType) -> Void
  var didSelectCompletion: completion?
  func goToCommentsFor(post: PostType) {
    didSelectCompletion?(post)
  }
}

class PostTableViewModelTest: XCTestCase {
    
  var store: DummyStore?
  var apiClient: DummyEndPoint?
  
  override func setUp() {
    super.setUp()
    store = DummyStore()
    apiClient = DummyEndPoint()
  }
  
  override func tearDown() {
    super.tearDown()
    store = nil
    apiClient = nil
  }
  
  func testPostLoad() {
    let postViewModel = PostTableViewModel(apiClient: apiClient!, store: store!)
    let expectation = self.expectation(description: "LoadingPost")
    postViewModel.loadPosts {
      expectation.fulfill()
    }
    waitForExpectations(timeout: 0.5, handler: nil)
    XCTAssertEqual(postViewModel.numberOfPosts(), apiClient?.posts.count)
    XCTAssertEqual(postViewModel.postAt(index: 1).title, apiClient?.posts[1].title)
    XCTAssertEqual(postViewModel.postAt(index: 1).body, apiClient?.posts[1].body)
    XCTAssertEqual(postViewModel.postAt(index: 1).title, apiClient?.posts[1].title)
    XCTAssertEqual(postViewModel.postAt(index: 1).body, apiClient?.posts[1].body)
  }
  
  func testPostSelection() {
    let dummyCoordinator = DummyCoordinator()
    let postViewModel = PostTableViewModel(apiClient: apiClient!, store: store!)
    postViewModel.coordinatorDelegate = dummyCoordinator
    let selectedIndex = 1
    let expectation = self.expectation(description: "LoadingPost")
    expectation.expectedFulfillmentCount = 2
    dummyCoordinator.didSelectCompletion = {
      post in
      XCTAssertEqual(postViewModel.postAt(index: selectedIndex).title, post.title)
      expectation.fulfill()
    }
    postViewModel.loadPosts {
      postViewModel.didSelectAt(index: selectedIndex)
      expectation.fulfill()
    }
    waitForExpectations(timeout: 0.5, handler: nil)
  }
    
}
