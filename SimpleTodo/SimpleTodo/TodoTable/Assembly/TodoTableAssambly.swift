//
//  TodoListAssambly.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 08.02.2025.
//

import UIKit

class TodoTableAssambly {
    static func createModule() -> UITableViewController {
        let storyboard = UIStoryboard(name: "MainTableView", bundle: nil)
        guard let viewC = storyboard.instantiateViewController(withIdentifier: "MainTableView") as? TableViewController else {
            fatalError()
        }
        
        let interactor = TodoTableInteractor()
        let presenter = TodoTablePresenter()
        let router = TodoTableRouter()
        
        
        viewC.presenter = presenter
        
        router.viewController = viewC
        
        presenter.view = viewC
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter
        
        return viewC
    }
}
