//
//  TodoListRouter.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 08.02.2025.
//

import UIKit

protocol TodoTableRouterProtocol: AnyObject {
    func navigateToTodoDetail(_ todo: TodoModel)
}

class TodoTableRouter {
//    weak var viewController: TableViewController?
    weak var viewController: UIViewController?
}

extension TodoTableRouter: TodoTableRouterProtocol {
    func navigateToTodoDetail(_ todo: TodoModel) {
        let detailVC = TodoDetailAssambly.createModule(for: todo)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
