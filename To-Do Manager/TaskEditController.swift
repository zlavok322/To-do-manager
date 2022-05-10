//
//  TaskEditController.swift
//  To-Do Manager
//
//  Created by Слава Шестаков on 10.05.2022.
//

import UIKit

class TaskEditController: UITableViewController {

    // параметры задачи
    var taskText: String = ""
    var taskType: TaskPriority = .normal
    var taskStatus: TaskStatus = .planned
    var doAfterEdit: ((String, TaskPriority, TaskStatus) -> Void)?
    
    @IBOutlet var taskTitle: UITextField!
    @IBOutlet var taskTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // обновление текстового поля с названием задачи
        taskTitle.text = taskText
        
        // обновление метки в соответствии текущим типом
        taskTypeLabel.text = taskTitles[taskType]
    }
    // Название типов задач
    private var taskTitles: [TaskPriority: String] = [
        .important: "Важная",
        .normal: "Текущая"
    ]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    

}
