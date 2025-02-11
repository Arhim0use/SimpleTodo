//
//  ViewController.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 29.01.2025.
//

import UIKit

protocol TodoDetailViewControllerProtocol: AnyObject {
    func showTodo()
}

extension TodoDetailViewController: TodoDetailViewControllerProtocol {
    func showTodo() {
        TodoTitleLable.text = todoItem?.title
        TodoDateLable.text = todoItem?.createdAt.description
        TodoDescriptionLable.text = todoItem?.description
    }
}

class TodoDetailViewController: UIViewController {
    
    var todoItem: TodoModel?
    weak var presenter: TodoDetailPresenterProtocol?

    @IBOutlet weak var TodoTitleLable: UILabel!
    
    @IBOutlet weak var TodoDateLable: UILabel!
    
    @IBOutlet weak var TodoDescriptionLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
