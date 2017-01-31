//
//  TrainingPopoverMenuController.swift
//  Accubow
//
//  Created by Ангелина Латаш on 31/01/2017.
//  Copyright © 2017 Ангелина Латаш. All rights reserved.
//

import UIKit

class TrainingPopoverMenuController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate {
    
    let cellIdentifier = "menuPopoverCell"
    let popoverMenuCellTitles = ["DETERMINE YOUR STARTING RESISTANCE",
                               "STRENGTH TRAINING",
                               "STAMMA AND STABILITY TRAINING"]
    
    override func viewWillAppear(_ animated: Bool) {
        print("TrainingPopoverMenuController: \(#function)")
    }
    
    override func viewDidLoad() {
        print("TrainingPopoverMenuController: \(#function)")
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        print("TrainingPopoverMenuController: \(#function)")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: table view datasource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        cell?.textLabel?.text = popoverMenuCellTitles[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.view.bounds.height / 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return popoverMenuCellTitles.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TrainingPopoverMenuController: \(#function)")
        dismiss(animated: true, completion: nil)
        self.popoverPresentationController?.delegate?.popoverPresentationControllerDidDismissPopover!(popoverPresentationController!)
    }
    
}
