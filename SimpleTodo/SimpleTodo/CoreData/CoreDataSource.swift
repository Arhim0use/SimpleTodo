//
//  CoreDataSorce.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 29.01.2025.
//

import CoreData

protocol TodoDataSourceProtocol {
    func createToDo(todoEntity: TodoModel)
    func getToDos() -> Result<[TodoEntity], Error>
    func getToDo(todoId: Int) -> Result<TodoEntity, Error>
    func getToDo(todoTitle: String) -> Result<[TodoEntity], Error>
    func updateToDo(todoId: Int, toNext todoEntity: TodoModel)
    func deleteToDo(todoId: Int)
    func toggleToDoCompleted(todoId: Int)
}

class TodoCoreDataSource: TodoDataSourceProtocol {
    static let shared = TodoCoreDataSource()
    
    func createToDo(todoEntity: TodoModel) {
        let context = CoreDataStack.shared.context
        
        switch getToDo(todoId: todoEntity.id) {
        case .success(_):
            print("Todo already exists")
        default:
            let todo = TodoEntity(context: context)
            todo.desc = todoEntity.description
            todo.title = todoEntity.title
            todo.completed = todoEntity.completed
            todo.createdAt = todoEntity.createdAt
            todo.userId = Int32(todoEntity.userId)
            todo.id = Int32(todoEntity.id)
            
            CoreDataStack.shared.saveContext()
        }
    }
    
    func getToDos() -> Result<[TodoEntity], Error> {
        let context = CoreDataStack.shared.context
        
        let fetchRequest: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
        
        do {
            let todos = try context.fetch(fetchRequest)
            return .success(todos)
        } catch {
            return .failure(error)
        }
    }
    
    func getToDo(todoId: Int) -> Result<TodoEntity, Error> {
        let context = CoreDataStack.shared.context
        
        let fetchRequest: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", todoId)
        
        do {
            if let todo = try context.fetch(fetchRequest).first {
                return .success(todo)
            } else {
                return .failure(DataStreamError.notFound("With id: \(todoId)"))
            }
        } catch {
            return .failure(error)
        }
    }
    
    func getToDo(todoTitle: String) -> Result<[TodoEntity], Error> {
        let context = CoreDataStack.shared.context
        
        let fetchRequest: NSFetchRequest<TodoEntity> = TodoEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", todoTitle)
        
        do {
            return .success(try context.fetch(fetchRequest))
        } catch {
            return .failure(error)
        }
    }
    
    func updateToDo(todoId: Int, toNext todoEntity: TodoModel) {
        let context = CoreDataStack.shared.context

        do {
            let todo = try getToDo(todoId: todoId).get()
            todo.title = todoEntity.title
            todo.completed = todoEntity.completed
            todo.desc = todoEntity.description
            try context.save()
        } catch {
            print("Error to update todo: \(error)")
        }
    }
    
    func toggleToDoCompleted(todoId: Int) {
        let context = CoreDataStack.shared.context
        
        do {
            let todo = try getToDo(todoId: todoId).get()
            todo.completed.toggle()
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func deleteToDo(todoId: Int) {
        let context = CoreDataStack.shared.context
        
        do {
            let todo = try getToDo(todoId: todoId).get()
            context.delete(todo)
        } catch {
            print(error)
        }
    }

}
