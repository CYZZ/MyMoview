//
//  PersonViewControllerMock.swift
//  MyMoviewTests
//
//  Created by CYZ on 2021/6/19.
//


@testable import MyMoview

class PersonViewControllerMock: PersonViewController {
	
	var didCallViewDidLoad = false

    override func viewDidLoad() {
        super.viewDidLoad()
		didCallViewDidLoad = true
    }
    
}
