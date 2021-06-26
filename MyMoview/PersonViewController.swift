//
//  PersonViewController.swift
//  MyMoview
//
//  Created by CYZ on 2021/6/19.
//

import UIKit

class PersonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		setupView()
		
		myObseverNotice()
    }
	
	/// 初始化视图
	func setupView() {
		let button = UIButton(type: .custom)
		
		self.view.addSubview(button)
	}
	
    
	/// 开始监听通知
	func myObseverNotice()  {
		NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess), name: .LoginSuccessKey, object: nil)
	}
	
	// Target Action
//	func buttonAction() {
//		print("start click button")
//		NotificationCenter.default.post(name: .LoginSuccessKey, object: nil)
//	}
	
	@objc func loginSuccess() {
		print("开始登录成功了")
		showToast()
	}
	// 显示登录成功
	func showToast() {
		DispatchQueue.main.async {
			let toast = MyToastView(frame: CGRect.zero) { str in
				print("close call Back str=\(str)")
			}
			self.view.addSubview(toast)
		}
		
	}
}

class MyToastView: UIView {
	
	var myHandler:((String)->Void)?
	
	lazy var closeButton: UIButton = {
		let btn = UIButton(type: .custom)
		btn.setTitle("关闭", for: .normal)
		btn.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
		return btn
	}()
	
	init(frame:CGRect,closeHandler:((_ str:String)->Void)?) {
		super.init(frame: frame)
		self.addSubview(closeButton)
		self.myHandler = closeHandler
	}
	
	@objc func buttonAction(_ sender:UIButton) {
		myHandler?("closeAction")
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension Notification.Name {
	static let LoginSuccessKey = Notification.Name("LoginSuccessKey")
}
