//
//  DiscoverViewModelTest.swift
//  News
//
//  Created by VT on 8/15/23.
//

import Foundation
import XCTest
@testable import News

class DiscoverViewModelTest: XCTestCase {
    
    private var viewModel: DiscoverViewModel!
    private var defaultCategoryExpectation = XCTestExpectation(description: "is default category")
    private var allCategoriesExpectation = XCTestExpectation(description: "all categories")
    
    override func setUp() {
        super.setUp()
        
        viewModel = DiscoverViewModel(service: MockHttpClient(fileName: ""))
    }
    
    override func tearDown() {
        super.tearDown()
        
        viewModel = nil
    }
    
    func test_default_category() {
        XCTAssertEqual(viewModel.defaultCategory, .general)
        defaultCategoryExpectation.fulfill()
        wait(for: [defaultCategoryExpectation], timeout: 1)
    }
    
    func test_all_categories() {
        let isTechCategory = viewModel.allCategories.first?.title == "Technology"
        XCTAssertEqual(isTechCategory, false)
        allCategoriesExpectation.fulfill()
        wait(for: [allCategoriesExpectation], timeout: 1)
    }
}
