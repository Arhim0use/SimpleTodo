//
//  File.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 06.02.2025.
//

import UIKit

class TodoDetailAssambly {
    static func createModule() -> TodoDetailViewController {
        let interactor = TodoDetailInteractor()
        let router = TodoDetailRouter()
        let presenter = TodoDetailPresenter()
        let viewController = TodoDetailViewController()
        
        interactor.presenter = presenter
        router.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view.viewController = viewController
        
        return viewController
    }
}
