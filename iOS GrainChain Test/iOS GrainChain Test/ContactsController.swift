//
//  ContactsController.swift
//  iOS GrainChain Test
//
//  Created by Sokolabs on 3/27/19.
//  Copyright © 2019 roho. All rights reserved.
//

import UIKit

class ContactsController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navBarContacts: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContactsInfo.instance.arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell") as! ContactsTableViewCell
        let row = indexPath.row
        cell.txtName.text! = ContactsInfo.instance.arrayName[row]
        cell.txtLastName.text! = ContactsInfo.instance.arrayLastName[row]
        cell.txtAge.text! = "\(ContactsInfo.instance.arrayAge[row])"
        cell.txtPhone.text! = ContactsInfo.instance.arrayPhone[row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            removeInfoContacts(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
    }
    
    func removeInfoContacts(_ row: Int){
        ContactsInfo.instance.arrayName.remove(at: row)
        ContactsInfo.instance.arrayLastName.remove(at: row)
        ContactsInfo.instance.arrayAge.remove(at: row)
        ContactsInfo.instance.arrayPhone.remove(at: row)
    }

}
