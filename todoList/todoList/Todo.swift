//
//  Todo.swift
//  TodoList
//
//  Created by joonwon lee on 2020/03/19.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit


// TODO: Codable과 Equatable 추가
struct Todo: Codable, Equatable {
    let id: Int
    var isDone: Bool
    var detail: String
    var isToday: Bool
    
    // 스스로 업데이트, 뮤테이팅
    mutating func update(isDone: Bool, detail: String, isToday: Bool) {
        // TODO: update 로직 추가
        self.isDone = isDone
        self.detail = detail
        self.isToday = isToday
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        // TODO: 동등 조건 추가
        return lhs.id == rhs.id
    }
}

class TodoManager {
    
    // 싱글톤
    static let shared = TodoManager()
    
    static var lastId: Int = 0
    
    var todos: [Todo] = []
    
    // 투두 만들기
    func createTodo(detail: String, isToday: Bool) -> Todo {
        //TODO: create로직 추가
        // 새로운 아이디
        let nextId = TodoManager.lastId+1
        TodoManager.lastId = nextId
        return Todo(id: nextId, isDone: false, detail: detail, isToday: isToday)
    }
    
    
    func addTodo(_ todo: Todo) {
        //TODO: add로직 추가
        todos.append(todo) // 추가
        saveTodo() // 업데이트
        
    }
    
    func deleteTodo(_ todo: Todo) {
        //TODO: delete 로직 추가
//        if let index = todos.firstIndex(of: todo){
//            todos.remove(at: index)
//        }
        // 더 효율적인 방식
//        todos = todos.filter{ existingTodo in
//            return existingTodo.id != todo.id
//        }
//        //완전 줄인 방식
        todos = todos.filter{$0.id != todo.id}
        saveTodo()
    }
    
    func updateTodo(_ todo: Todo) {
        //TODO: updatee 로직 추가
        guard let index = todos.firstIndex(of: todo) else {return}
        todos[index].update(isDone: todo.isDone, detail: todo.detail, isToday: todo.isToday)
        saveTodo()
    }
    
    func saveTodo() {
        Storage.store(todos, to: .documents, as: "todos.json")
    }
    
    func retrieveTodo() {
        todos = Storage.retrive("todos.json", from: .documents, as: [Todo].self) ?? []
        
        let lastId = todos.last?.id ?? 0
        TodoManager.lastId = lastId
    }
}

class TodoViewModel {
    
    enum Section: Int, CaseIterable {
        case today
        case upcoming
        
        var title: String {
            switch self {
            case .today: return "Today"
            default: return "Upcoming"
            }
        }
    }
    
    private let manager = TodoManager.shared
    
    var todos: [Todo] {
        return manager.todos
    }
    
    var todayTodos: [Todo] {
        return todos.filter { $0.isToday == true }
    }
    
    var upcompingTodos: [Todo] {
        return todos.filter { $0.isToday == false }
    }
    
    var numOfSection: Int {
        return Section.allCases.count
    }
    
    func addTodo(_ todo: Todo) {
        manager.addTodo(todo)
    }
    
    func deleteTodo(_ todo: Todo) {
        manager.deleteTodo(todo)
    }
    
    func updateTodo(_ todo: Todo) {
        manager.updateTodo(todo)
    }
    
    func loadTasks() {
        manager.retrieveTodo()
    }
}

