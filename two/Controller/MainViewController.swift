//
//  MainViewController.swift
//  two
//
//  Created by imac-2626 on 2024/7/17.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController {

    @IBOutlet weak var tbText: UITableView!
    
    @IBOutlet weak var tvText: UITextView!
    
    @IBOutlet weak var btcheck: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    func setUI(){
        tableSet()
    }
    func tableSet(){
        tbText.register(UINib(nibName: "MainTableViewCell", bundle: nil),
                        forCellReuseIdentifier: MainTableViewCell.identifier)
        tbText.delegate = self
        tbText.dataSource = self
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        let persons = try! Realm().objects(dog.self)
        if  realm == realm {
            let table=realm.objects(dog.self)
            return table.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let realm = try! Realm()
        let table=realm.objects(dog.self)
        let cell = tbText.dequeueReusableCell(withIdentifier: "MainTableViewCell",
                                              for: indexPath) as! MainTableViewCell
        cell.name.text=table[indexPath.row].name
        
//        guard let cell = tbText.dequeueReusableCell(withIdentifier: "MainTableViewCell",
//                                                    for: indexPath) as? MainTableViewCell else{return UITableViewCell()}
        return cell
    }
    
    
}
