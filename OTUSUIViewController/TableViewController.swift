//
//  TableViewController.swift
//  OTUSUIViewController
//
//  Created by Dmitry Chicherin on 16/5/2566 BE.
//

import UIKit

struct User {
    let name: String
    let surname: String
    let midname: String
    let address: String
}

class TableViewController: ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var userCell: UserCell!
    @IBOutlet weak var tableUsersView: UITableView!
    var users: [User] = [
        User(name: "Obe", surname: "Obi", midname: "Ilich", address: "Moscow, Street, Home"),
        User(name: "Kuul", surname: "Petrov", midname: "Sidorovich", address: "5322 Calzada Del Bosque Rancho Santa Fe, California(CA), 92067"),
        User(name: "Dmitrii", surname: "Chicherin", midname: "Olegovich", address: "secret")
    ]
}
//инициализация таблицы
extension TableViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell")
        if let cell = cell as? UserCell {
            let name = users[indexPath.row]
            cell.setup(withName: name)
        }
        
        return cell!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
//Переход и передача данных
extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailObj = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        detailObj?.fio = users[indexPath.row].surname + " " + users[indexPath.row].name + " " + users[indexPath.row].midname
        detailObj?.address = users[indexPath.row].address
        self.navigationController?.pushViewController(detailObj!, animated: true)
    }
}
