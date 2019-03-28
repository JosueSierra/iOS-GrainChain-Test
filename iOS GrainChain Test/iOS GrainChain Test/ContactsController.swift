//
//  ContactsController.swift
//  iOS GrainChain Test
//
//  Created by Sokolabs on 3/27/19.
//  Copyright © 2019 roho. All rights reserved.
//

import UIKit

class ContactsController: UIViewController, UITableViewDelegate,UITableViewDataSource, UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navBarContacts: UINavigationBar!
    
    var isFiltering = false
    var filterArray = [String:[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return filterArray.count
        }
        return ContactsInfo.instance.arrayName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell") as! ContactsTableViewCell
        let row = indexPath.row
        isFiltering ? infoContactsFiltering(cell, row) : infoContacts(cell, row)
        return cell
    }
    
    func infoContactsFiltering(_ cell: ContactsTableViewCell, _ row: Int){
        var pathName = (filterArray.keys.map{value in value})
        cell.txtName.text! = pathName[row]
        cell.txtLastName.text! = filterArray[pathName[row]]![0]
        cell.txtAge.text! = "\(filterArray[pathName[row]]![1])"
        cell.txtPhone.text! = filterArray[pathName[row]]![2]
    }
    
    func infoContacts(_ cell: ContactsTableViewCell, _ row: Int){
        cell.txtName.text! = ContactsInfo.instance.arrayName[row]
        cell.txtLastName.text! = ContactsInfo.instance.arrayLastName[row]
        cell.txtAge.text! = "\(ContactsInfo.instance.arrayAge[row])"
        cell.txtPhone.text! = ContactsInfo.instance.arrayPhone[row]
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
    
    @IBAction func itemSearch(_ sender: Any) {
        ContactsInfo.instance.assignDict()
        searchController().hidesNavigationBarDuringPresentation = false
        searchController().searchBar.keyboardType = UIKeyboardType.asciiCapable
        self.searchController().searchBar.delegate = self
        present(searchController(), animated: true, completion: nil)
    }
    
    func searchController()->UISearchController{
        let controller = UISearchController(searchResultsController: nil)
        controller.delegate = self
        controller.searchBar.delegate = self
        controller.searchResultsUpdater = self
        controller.dimsBackgroundDuringPresentation = false
        controller.hidesNavigationBarDuringPresentation = true
        controller.searchBar.sizeToFit()
        return controller
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text!.isEmpty{
            isFiltering = false
            tableView.reloadData()
            return
        }
        filterArray = ContactsInfo.instance.dictContact.filter { (contacts) -> Bool in
            return contacts.key.lowercased().contains(searchController.searchBar.text!.lowercased())
        }
        isFiltering = true
        tableView.reloadData()
    }
    
    
}
