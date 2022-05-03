//
//  AssignmentTests.swift
//  AssignmentTests
//
//  Created by Yashashree on 03/05/22.
//

import XCTest
@testable import Assignment

class AssignmentTests: XCTestCase {
    var vc: CryptoViewController!
    override func setUp() {
        vc = CryptoViewController()
        _ = vc.view
    }
    
    func testIsTableLoaded(){
        XCTAssertNotNil(vc.tableView)
    }

    func testTableViewSetDatasource(){
        XCTAssertTrue(vc.tableView.dataSource is CryptoViewController)
    }
    
    func testTableViewSetDelegate(){
        XCTAssertTrue(vc.tableView.delegate is CryptoViewController)
    }

}
