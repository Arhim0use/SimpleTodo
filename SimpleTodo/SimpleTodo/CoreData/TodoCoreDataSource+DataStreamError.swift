//
//  TodoCoreDataSource+DataStreamError.swift
//  SimpleTodo
//
//  Created by Chingisbek Anvardinov on 29.01.2025.
//

import Foundation

extension TodoCoreDataSource {
    enum DataStreamError: Error {
        case invalidData(String)
        case notFound(String)
    }
}
