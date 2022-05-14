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
    @IBOutlet var taskStatusSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // обновление текстового поля с названием задачи
        taskTitle.text = taskText
        
        // обновление метки в соответствии текущим типом
        taskTypeLabel.text = taskTitles[taskType]
        
        // обновляем статус задачи
        if taskStatus == .completed {
            taskStatusSwitch.isOn = true
        }
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.selectionStyle = .none
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaskTypeScreen" {
            // ссылка на контроллер назначения
            let destination = segue.destination as! TaskTypeController
            // передача выброанного типа
            destination.selectedType = taskType
            // передача обработчика выбора типа
            destination.doAfterTypeSelected = { [self] selectedType in
                taskType = selectedType
                // обновляем метку с текущим типом
                taskTypeLabel.text = taskTitles[taskType]
            }
        }
    }

    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        // получаем актуальные значения
//        var title: String = ""
        var title = taskTitle.text ?? ""
        let type = taskType
        let status: TaskStatus = taskStatusSwitch.isOn ? .completed : .planned
        if !(taskTitle.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? false) {
            title = taskTitle.text ?? ""
            doAfterEdit?(title, type, status)
            // возвращаемся к предыдущему экрану
            navigationController?.popViewController(animated: true)
        } else {
            errorAlert()
        }
//        // вызываем обработчик
//        doAfterEdit?(title, type, status)
//        // возвращаемся к предыдущему экрану
//        navigationController?.popViewController(animated: true)
    }
    
    func errorAlert() {
        let alert = UIAlertController(title: "Ошибка", message: "Не может быть пустой задачи", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

