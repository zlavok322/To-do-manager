//
//  TaskStorage.swift
//  To-Do Manager
//
//  Created by Слава Шестаков on 05.05.2022.
//

import Foundation

// Проток описывающий сущность "Хранилище задач"
protocol TasksStorageProtocol {
    func loadTasks() -> [TaskProtocol]
    func saveTasks(_ tasks: [TaskProtocol])
}

// Сущность "Хранилище задач"

class TasksStorage: TasksStorageProtocol {
    func loadTasks() -> [TaskProtocol] {
        // временная реализация, возвращаюшая тестовую коллекцию задач
        let testTasks: [TaskProtocol] = [
            Task(title: "Купить хлеб", type: .normal, status: .planned),
            Task(title: "Помыть кота", type: .important, status: .planned),
            Task(title: "Отдать долг Арнольду", type: .important, status: .completed),
            Task(title: "Купить новый пылесос", type: .normal, status: .planned),
            Task(title: "Подарить цветы Катюше", type: .important, status: .planned),
            Task(title: "Позвонить родителям", type: .important, status: .planned),
            Task(title: "Пригласить на вечеринку Дольфа, Джеки, Леонардо, Уилла и Брюса", type: .important, status: .planned)
        ]
        return testTasks
    }
    
    func saveTasks(_ tasks: [TaskProtocol]) {
        
    }
    
    
}
