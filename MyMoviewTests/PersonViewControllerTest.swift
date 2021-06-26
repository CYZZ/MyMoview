//
//  PersonViewControllerTest.swift
//  MyMoviewTests
//
//  Created by CYZ on 2021/6/19.
//

import Quick
import Nimble
@testable import MyMoview

class PersonViewControllerTest: QuickSpec {
	
	override func spec() {
		
		var viewController:PersonViewControllerMock!
		
		describe("PersonViewController") { 
			beforeEach {
				viewController = PersonViewControllerMock()
				_ = viewController.view
			}
			
			context("when it initialize") { 
				it("did call viewDidLoad") { 
					expect(viewController.didCallViewDidLoad).to(beTrue())
				}
			}
			
			context("notification event") { 
				it("post name is 'LoginSuccessKey'") { 
					DispatchQueue.main.async {
						NotificationCenter.default.post(name: .LoginSuccessKey, object: nil)
					}
					
					var toastView:MyToastView?
					DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+DispatchTimeInterval.milliseconds(500)) {
						for view in viewController.view.subviews {
							if let toastV = view as? MyToastView {
								toastView = toastV
								break
							}
						}
						
						print("toastView = \(toastView)")
						toastView?.closeButton.sendActions(for: .touchUpInside)
					}
					expect(toastView).toNotEventually(beNil(), timeout: .seconds(2), pollInterval: .milliseconds(200), description: nil)
//					expect(toastView).toNot(beNil())
					
//					print("----1----")
//					waitUntil(timeout: .seconds(5)) { done in
//						print("----2----")
//						var toastView:MyToastView?
//						for view in viewController.view.subviews {
//							if let toastV = view as? MyToastView {
//								toastView = toastV
//								break
//							}
//						}
//						toastView?.closeButton.sendActions(for: .touchUpInside)
//						print("toastView = \(toastView)")
//						done()
//					}
//					print("----3----")
//					waiuti
					
//					expect(viewController.view).toEventually(<#T##matcher: Matcher##Matcher#>)
				}
			}
		}
	}

}
