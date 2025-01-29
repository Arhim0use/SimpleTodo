//
//  Network.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 29.01.2025.
//

import Foundation
import Alamofire

protocol TodoNetworkFetchProtocol {
    func fetchTodos(completion: @escaping (Result<[TodoModel], Error>) -> Void)
}

class TodoAPI: TodoNetworkFetchProtocol {
    
    static let shared = TodoAPI()
    private var _url = "https://dummyjson.com/todos"
    
    func fetchTodos(completion: @escaping (Result<[TodoModel], Error>) -> Void) {
        guard let url = URL(string: _url) else {
            return completion(.failure(AFError.invalidURL(url: _url)))
        }
        
        AF.request(url, method: .get).responseDecodable(of: TodosJSON.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data.todos.map { $0.toTodoModel() }))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

