//
//  TodoTableViewController.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 29.01.2025.
//

import UIKit

#if DEBUG
fileprivate let staticTodos: [TodoModel] = [TodoModel(id: 1, title: "Create TodoApp", description: "First Todo Description", completed: false), TodoModel(id: 2, title: "Post TodoApp", description: "Second Todo Description", completed: false), TodoModel(id: 3, title: "Create Readme for TodoApp", description: "Create Description", completed: false)]
#endif

protocol TodoTableViewControllerProtocol: AnyObject {
    func showTodos(_ todos: [TodoModel])
    func showError(_ message: String)
}

class TableViewController: UITableViewController {

    var presenter: TodoTablePresenterProtocol?
    let todoIdentifier = "TodoTableViewCell"
    var todos: [TodoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TableView"
        createTable()
        
        presenter?.viewDidLoad()
        
    }
    
    private func createTable() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: todoIdentifier)

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth/*, .flexibleBottomMargin*/]
        self.todos = staticTodos
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: todoIdentifier, for: indexPath)
        
        cell.textLabel?.text = todos[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showDetail(for: todos[indexPath.row])
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}

extension TableViewController: TodoTableViewControllerProtocol {
    func showTodos(_ todos: [TodoModel]) {
        self.todos = todos
        tableView.reloadData()
        print("showTodos", #function)
    }
    
    func showError(_ message: String) {
        print(message)
    }
    
}

