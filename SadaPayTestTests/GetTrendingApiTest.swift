//
//  GetTrendingApiTest.swift
//  SadaPayTestTests
//
//  Created by Asfand Hafeez on 04/08/2022.
//

import XCTest
@testable import SadaPayTest
class GetTrendingApiTest: XCTestCase {

    func test_trendingUserApi(){
        let network = NetworkingHandler()
        let expectation = self.expectation(description: "trendingUserApi")
        network.getDataFromAPi(url: URL(string: BASE_URL)!, resultType: TrendingModel.self) { result in
            XCTAssertNotNil(result)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
