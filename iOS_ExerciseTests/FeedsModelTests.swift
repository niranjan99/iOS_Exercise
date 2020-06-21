
//  FeedsModelTests.swift
//  iOS_Exercise
//
//  Created by Niranjan on 20/06/20.
//  Copyright © 2020 Niranjan. All rights reserved.
//

import XCTest
@testable import iOS_Exercise

class FeedsModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testEmptyFeedsResult() {
        let data = Data()
        let completion: ((Result<FeedsModel, ErrorResult>) -> Void) = { result in
            switch result {
            case .success:
                XCTAssert(false, "Expected failure when no data")
            default:
                break
            }
        }
        ParserHelper.parse(data: data, completion: completion)
    }

    func testParseFeedsResult() {
        let data = MockData().getFactsData()
        let completion: ((Result<FeedsModel, ErrorResult>) -> Void) = { result in
            switch result {
            case .failure:
                XCTAssert(false, "Expected valid FeedsModel")
            case .success(let response):
                XCTAssertEqual(response.title, "About Canada", "Expected About Canada base")
                if let list = response.rows {
                    XCTAssertEqual(list.count, 14, "Expected 14 rates")

                } else {
                    XCTAssert(false, "Expected valid ListModel")
                }
            }
        }
        ParserHelper.parse(data: data, completion: completion)
    }

    func testWrongKeyFeedsResult() {
        let data = Data()
        let result = FeedsModel.parseObject(data: data)
        switch result {
        case .success:
            XCTAssert(false, "Expected failure when wrong data")
        default:
            return
        }
    }
}
