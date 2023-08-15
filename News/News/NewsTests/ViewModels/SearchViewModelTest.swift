//
//  SearchViewModelTest.swift
//  NewsTests
//
//  Created by VT on 8/14/23.
//

import XCTest
import Combine
@testable import News

class SearchViewModelTest: XCTestCase {
    private var fileName = "NewsResponse"
    private var viewModel: SearchViewModel!
    private var cancellable: AnyCancellable?
    
    private var searchQuerySuccess = "VT"
    private var searchQuerySuccessExpectation = XCTestExpectation(description: "search query is valid")
    private var loadingExpectation = XCTestExpectation(description: "isLoading true")
    
    override func setUp() {
        super.setUp()
        viewModel = SearchViewModel(service: MockHttpClient(fileName: fileName))
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func test_finished_State() {
        let expectation = expectValue(of: viewModel.$state.eraseToAnyPublisher(),
                                      expectationDescription: "is state finished",
                                      equals: [{ $0 == .finished}])
        viewModel.searchQuery = searchQuerySuccess
        viewModel.checkValidation()
        wait(for: [expectation.expectation], timeout: 1)
    }
    
    func test_search_query_valid() {
        XCTAssertEqual(searchQuerySuccess.isInValid(), false)
        searchQuerySuccessExpectation.fulfill()
        wait(for: [searchQuerySuccessExpectation], timeout: 1)
    }
    
    func test_showingAlert() {
        fileName = "vt"
        setUp()
        viewModel.checkValidation()
        
        cancellable = viewModel.objectWillChange.eraseToAnyPublisher().sink{_ in
            XCTAssertEqual(self.viewModel.showingAlert, true)
            self.loadingExpectation.fulfill()
        }
        wait(for: [loadingExpectation], timeout: 1)
    }
}
