//
//  MyMoviewTests.swift
//  MyMoviewTests
//
//  Created by CYZ on 2021/6/13.
//

@testable import MyMoview

import Quick 
import Nimble

class MyMoviewTests: QuickSpec {
	
	override func spec() {
		var subject:MoviesTableViewController!
		describe("MoviewTableViewControllerSpec") { 
			beforeEach {
				subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MoviesTableViewController") as! MoviesTableViewController
				_ = subject.view
//				subject.view.setNeedsUpdateConstraints() // update
			}
			
			context("When view is loaded") { 
				it("Should have 8 movies loaded") { 
					expect(subject.tableView.numberOfRows(inSection: 0)).to(equal(8))
				}
			}
			
			context("Table View") { 
				var cell:UITableViewCell!
				beforeEach {
					cell = subject.tableView(subject.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
				}
				it("should show movie title and genre") { 
					expect(cell.textLabel?.text).to(equal("The Emoji Movie"))
					expect(cell.detailTextLabel?.text).to(equal("Animation"))
				}
				
				it("did select cell") { 
					subject.tableView(subject.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
				}
				it("click right item") { 
//					let target = subject.navigationItem.rightBarButtonItem?.target
//					subject.perform(subject.navigationItem.rightBarButtonItem?.action)
					_ = subject.navigationItem.rightBarButtonItem?.target?.perform(subject.navigationItem.rightBarButtonItem?.action)
				}
				it("login button action") { 
					
					subject.loginButton.sendActions(for: UIControl.Event.touchUpInside)
					
				}
				it("register button action") { 
					subject.registerButton.sendActions(for: UIControl.Event.touchUpInside)
				}
			}
		}
	}

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
