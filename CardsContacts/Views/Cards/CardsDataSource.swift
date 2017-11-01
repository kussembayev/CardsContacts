//
//  CardsDataSource.swift
//  CardsContacts
//
//  Created by Rauan Kussembayev on 11/1/17.
//  Copyright © 2017 kuzya. All rights reserved.
//

import UIKit

// MARK: - Properties(Global)
let postCell = "PostTableViewCell"
let commentCell = "CommentTableViewCell"
let usersCell = "UsersTableViewCell"
let photoCell = "PhotoTableViewCell"
let todosCell = "TodosTableViewCell"

protocol CardsDataSourceDelegate: class {
    func getPost(byId id: Int)
    func getComment(byId id: Int)
    func getUser(byId id: Int)
    func getPhoto(byId id: Int)
    func getTodo(byId id: Int)
}

class CardsDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    weak var delegate: CardsDataSourceDelegate?
    var post: PostRecord?
    var comment: CommentRecord?
    var users: [UserRecord]?
    var photo: PhotoRecord?
    var todo: TodoRecord?

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: postCell, for: indexPath) as! PostTableViewCell
            cell.post = self.post
            cell.delegate = self
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: commentCell, for: indexPath) as! CommentTableViewCell
            cell.comment = self.comment
            cell.delegate = self
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: usersCell, for: indexPath) as! UsersTableViewCell
            cell.users = users
            cell.delegate = self
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: photoCell, for: indexPath) as! PhotoTableViewCell
            cell.photo = photo
            cell.delegate = self
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: todosCell, for: indexPath) as! TodosTableViewCell
            cell.todo = todo
            cell.delegate = self

            return cell
        default:
            return UITableViewCell()
        }

    }
}

// Cells' delegates
extension CardsDataSource: PostTableViewCellDelegate, CommentTableViewCellDelegate, UsersTableViewCellDelegate, PhotoTableViewCellDelegate, TodosTableViewCellDelegate {

    func getPost(byId id: Int) {
        delegate?.getPost(byId: id)
    }

    func getComment(byId id: Int) {
        delegate?.getComment(byId: id)
    }

    func getUser(byId id: Int) {
        delegate?.getUser(byId: id)
    }

    func getPhoto(byId id: Int) {
        delegate?.getPhoto(byId: id)
    }

    func getTodo(byId id: Int) {
        delegate?.getTodo(byId: id)
    }
}
