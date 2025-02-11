//
//  File.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 06.02.2025.
//

import UIKit

class TodoDetailAssambly {
    static func createModule(for todo: TodoModel) -> TodoDetailViewController {
        guard let vc = UIStoryboard(name: "MainTableView", bundle: nil).instantiateViewController(withIdentifier: "TodoDetailViewController") as? TodoDetailViewController else {
            return TodoDetailViewController()
        }

        let interactor = TodoDetailInteractor()
        let router = TodoDetailRouter()
        let presenter = TodoDetailPresenter()
        
        interactor.presenter = presenter
        
        router.view = vc
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = vc
        
        vc.presenter = presenter
        vc.todoItem = todo
        
        return vc
    }
}
