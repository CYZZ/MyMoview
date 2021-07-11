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
			context("present") {
				it(" history") { 
					viewController.present(HistoryViewController(), animated: false, completion: nil)
				}
				it("cache") { 
					viewController.present(CacheViewController(), animated: false, completion: nil)
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

				}
			}
		}
	}

}


fileprivate extension CacheViewController {

//	fileprivate override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
//		super.present(viewControllerToPresent, animated: flag, completion: completion)
//		print("has call present in extension viewControllerToPresent =======\(viewControllerToPresent)")
//		HistoryViewControllerTest.handlerSetting(viewControllerToPresent)
//	}
//	
//	open override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
//		super.dismiss(animated: flag, completion: completion)
//	}
//	
	
}
