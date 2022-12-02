//
//  SpaceAppModelTests.swift
//  SpaceAPPTests
//
//  Created by Issa Moradon 2022-11-20.
//

import XCTest
@testable import SpaceAPP

final class SpaceAppModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIssInfo() throws {
        let model = IssView()
        XCTAssertEqual(model.iss.latitude, model.iss.longitude)
         // XCTAssertNotEqual(model.iss.latitude, model.iss.longitude)
        
    }
    
    func testIssInfo2() throws {
        let model = IssView()
        XCTAssertEqual(model.iss.altitude, model.iss.velocity)
       //  XCTAssertNotEqual(model.iss.altitude, model.iss.velocity)
    }
    
    func testPeopleInfo() throws {
        let model =  PeopleView()
        XCTAssertEqual(model.people.number, 10)
        // XCTAssertEqual(model.people.number, 1)
    }
    func testPeopleInfo2() throws {
        let model = PeopleView()
        XCTAssertEqual(model.people.number, model.people.people.count)
        //  XCTAssertNotEqual(model.people.number, model.people.people.count)
    }
    
    func testPicture() throws {
        let model = pictureOfTodayView()
        XCTAssertEqual(model.manager.image, model.manager.photoInfo.image)
    }
    
    func testPicture2() throws {
        let model = pictureOfTodayView()
        XCTAssertEqual(model.manager.photoInfo.date, "")
        //  XCTAssertEqual(model.manager.photoInfo.date, "YYYY-TT-MM")
    }
    @MainActor func testNews() throws {
        let model = SpaceNew()
        XCTAssertEqual(model.news.capacity,0)
    }
}
