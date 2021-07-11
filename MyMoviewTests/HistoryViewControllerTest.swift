//
//  HistoryViewControllerTest.swift
//  MyMoviewTests
//
//  Created by CYZ on 2021/7/10.
//

import Quick
import Nimble
@testable import MyMoview

class HistoryViewControllerTest: QuickSpec {
	override func spec() {
		describe("HistoryViewController") { 
			var setting:SettingPage!
			beforeEach {
				setting = SettingPage()
				let window = UIWindow()
				window.frame = UIScreen.main.bounds
				window.rootViewController = setting
				window.makeKeyAndVisible()
				_ = setting.view
			}
			
			context("present") { 
				it("history") { 
//					setting.presentHistory()
//					let history = setting.presentedViewController
//					expect(history).toNot(beNil())
//					print("history ======= \(String(describing: history))")
				}
				it("other") { 
					let vc = UIViewController()
					
					let window = UIWindow()
					window.frame = UIScreen.main.bounds
					window.rootViewController = vc
					window.makeKeyAndVisible()
				
					let cache = CacheViewController()
					
					window.makeKeyAndVisible()
					vc.present(cache, animated: true, completion: nil)
					cache.beginAppearanceTransition(true, animated: false)
					cache.endAppearanceTransition()
					expect(vc.presentedViewController).toNot(beNil())
					print("vc.presentedViewController1 = \(vc.presentedViewController)")
					
					
					
					vc.presentedViewController?.present(setting, animated: false, completion: nil)
					print("vc.presentedViewController2 = \(vc.presentedViewController)")
					print("vc.presentedViewController.presentedViewController = \(vc.presentedViewController?.presentedViewController)")

					
				}
			}
		}
	}
	var presentHandler:(()->Void)?
}

extension HistoryViewControllerTest {
	static func handlerSetting(_ vc:UIViewController) {
		
	}
}

fileprivate extension CacheViewController {

	
	open override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
		super.present(viewControllerToPresent, animated: flag, completion: completion)
		print("has call present in extension viewControllerToPresent =======\(viewControllerToPresent)")
		HistoryViewControllerTest.handlerSetting(viewControllerToPresent)
	}
	
	open override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
		super.dismiss(animated: flag, completion: completion)
		
	}
	dynamic func abc() {
		
	}
	
	@_dynamicReplacement(for:abc())
	func anotherTest() {
		debugPrint("另一个测试方法 -  anotherTest")
		abc()
	}

	
}
