//
//  CardsViewController.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

class CardsViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties
    var dataSource: CardsDataSource!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        hideKeyboardWhenTappedAround()
        updatePostCell(byId: 1)
        updateCommentCell(byId: 1)
        updateUsersCell(byId: nil)
        updatePhotoCell(byId: 3)
        updateTodoCell(byId: 3)
    }

    private func setupTableView() {
        dataSource = CardsDataSource()
        dataSource.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 360
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: postCell, bundle: nil), forCellReuseIdentifier: postCell)
        tableView.register(UINib(nibName: commentCell, bundle: nil), forCellReuseIdentifier: commentCell)
        tableView.register(UINib(nibName: usersCell, bundle: nil), forCellReuseIdentifier: usersCell)
        tableView.register(UINib(nibName: photoCell, bundle: nil), forCellReuseIdentifier: photoCell)
        tableView.register(UINib(nibName: todosCell, bundle: nil), forCellReuseIdentifier: todosCell)
    }

    fileprivate func updatePostCell(byId id: Int) {
        PostManager.shared.getPost(byId: id) { [unowned self] (post) in
            self.dataSource.post = post
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }

    fileprivate func updateCommentCell(byId id: Int) {
        CommentManager.shared.getComment(byId: id) { [unowned self] (comment) in
            self.dataSource.comment = comment
            let indexPath = IndexPath(row: 1, section: 0)
            self.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }

    fileprivate func updateUsersCell(byId id: Int?) {
        UsersManager.shared.listUsers(userId: id) {[unowned self] (users) in
            self.dataSource.users = users
            let indexPath = IndexPath(row: 2, section: 0)
            self.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }

    fileprivate func updatePhotoCell(byId id: Int) {
        PhotoManager.shared.getPhoto(byId: id) { (photo) in
            self.dataSource.photo = photo
            let indexPath = IndexPath(row: 3, section: 0)
            self.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }

    fileprivate func updateTodoCell(byId id: Int) {
        TodosManager.shared.getTodo(byId: id) { (todo) in
            self.dataSource.todo = todo
            let indexPath = IndexPath(row: 4, section: 0)
            self.tableView.reloadRows(at: [indexPath], with: .fade)
        }
    }
}

//
extension CardsViewController: CardsDataSourceDelegate {

    func getPhoto(byId id: Int) {
        updatePhotoCell(byId: id)
    }

    func getComment(byId id: Int) {
        updateCommentCell(byId: id)
    }

    func getPost(byId id: Int) {
        updatePostCell(byId: id)
    }

    func getUser(byId id: Int) {
        updateUsersCell(byId: id)
    }

    func getTodo(byId id: Int) {
        updateTodoCell(byId: id)
    }
}
