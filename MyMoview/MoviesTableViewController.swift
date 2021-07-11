//
//  MoviesTableViewController.swift
//  MyMoview
//
//  Created by CYZ on 2021/6/13.
//

import UIKit

class MoviesTableViewController: UITableViewController {
	
	var movies: [Movie] {
		return MoviesDataHelper.getMovies()
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		print("viewDidLoad in MoviesTableViewController")
		self.view.setNeedsUpdateConstraints()
		setupView()
    }
	
	func setupView() {
		self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "刷新", style: .plain, target: self, action: #selector(rightItemClick))
		
		self.view.addSubview(loginButton)
		self.view.addSubview(registerButton)
	}
	
	lazy var loginButton: UIButton = {
		let btn = UIButton(type: .custom)
		btn.setTitle("登录", for: .normal)
		btn.addTarget(self, action: #selector(loginButtonClick), for: .touchUpInside)
		return btn
	}()
	
	lazy var registerButton: UIButton = {
		let btn = UIButton(type: .custom)
		btn.setTitle("注册", for: .normal)
		btn.addTarget(self, action: #selector(registerButtonClick), for: .touchUpInside)
		return btn
	}()
	
	@objc fileprivate func rightItemClick() {
		print("已经点击了右边的按钮")
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		print("viewDidLayoutSubviews in MoviesTableViewController")
	}
	
	override func updateViewConstraints() {
		super.updateViewConstraints()
		print("updateViewConstraints in MoviesTableViewController")
	}

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
		let movie = movies[indexPath.row]
		cell.textLabel?.text = movie.title
		cell.detailTextLabel?.text = movie.genreString()

        // Configure the cell...

        return cell
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("didSelectRowAt \(indexPath.row)")
		
		present(PersonViewController(), animated: true, completion: nil)
		tableView.deselectRow(at: indexPath, animated: true)
	}

}

extension MoviesTableViewController {
	@objc fileprivate func loginButtonClick() {
		print("开始登录账号---1")
	}
	
	@objc fileprivate func registerButtonClick() {
		print("要注册新账号---2")
	}
}


enum Genre:Int {
	case Animation
	case Action
	case None
}

struct Movie {
	var title:String 
	var genre:Genre
	func genreString() -> String {
		switch genre {
		case .Action:
			return "Action"
		case .Animation:
			return "Animation"
		default:
			return "None"
		}
	}
}

class MoviesDataHelper {
	static func getMovies() -> [Movie] {
		return [
			Movie(title: "The Emoji Movie", genre: .Animation),
			Movie(title: "Logan", genre: .Action),
			Movie(title: "Wonder Woman", genre: .Action),
			Movie(title: "Zootopia", genre: .Animation),
			Movie(title: "The Baby Boss", genre: .Animation),
			Movie(title: "Despicable Me 3", genre: .Animation),
			Movie(title: "Spiderman: Homecoming", genre: .Action),
			Movie(title: "Dunkirk", genre: .Animation)
		]
	}
}
