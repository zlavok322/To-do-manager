//
//  Task.swift
//  To-Do Manager
//
//  Created by Слава Шестаков on 05.05.2022.
//

import Foundation

// требования к типу, описывающему сущность "Задача"
protocol TaskProtocol {
    // название
    var title: String { get set }
    // Тип
    var type: TaskPriority { get set }
    // Статус
    var status: TaskStatus { get set }
}

// сущность "Задача"
struct Task: TaskProtocol {
    var title: String
    var type: TaskPriority
    var status: TaskStatus
}

// тип задачи
enum TaskPriority {
    // текущая
    case normal
    // важная
    case important
}

// состояние задачи
enum TaskStatus: Int {
    // запланированная
    case planned
    // завершенная
    case completed
}
