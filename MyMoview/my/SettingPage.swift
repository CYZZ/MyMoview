//
//  SettingPage.swift
//  MyMoview
//
//  Created by CYZ on 2021/7/3.
//

import Foundation
import UIKit

class SettingPage: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .lightGray
		print("call function SettingPage->viewDidLoad")
		print("presentingViewController in setting is \(presentingViewController)")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	func presentHistory()  {
		present(HistoryViewController(), animated: false) { 
			print("has presented historyViewController")
		}
	}
	
	func presentVC(_ vc:UIViewController,from presenter:UIViewController) {
		presenter.present(vc, animated: false) { 
			print("presenter=\(presenter) has modal vc=\(vc)")
		}
	}
	
	deinit {
		
	}
}

extension SettingPage:UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
	
	
}
