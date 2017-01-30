//
//  GettingStartedViewController.swift
//  Accubow
//
//  Created by Ангелина Латаш on 30/01/2017.
//  Copyright © 2017 Ангелина Латаш. All rights reserved.
//


import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
    *  Array to display menu options
    */
    @IBOutlet var tblMenuOptions : UITableView!
    
    /**
    *  Transparent button to hide menu
    */
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    
    /**
    *  Array containing menu cell's identifiers
    */
    let menuCellIdentifiers = ["searchCellMenuID",
                               "settingsCellMenuID",
                               "arcadeCellMenuID",
                               "laserTrainingCellMenuID",
                               "gettingStartingCellMenuID"]
    
    /**
    *  Menu button which was tapped to display the menu
    */
    var btnMenu : UIButton!
    


    var delegate : SlideMenuDelegate?   // delegate of the MenuVC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenuOptions.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        print("MenuViewController: \(#function)")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("MenuViewController: \(#function)")
        super.viewWillAppear(animated)
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!) {
        print("MenuViewController: \(#function)")
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
        })
    }
    
    // MARK: table view datasource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: menuCellIdentifiers[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("MenuViewController: \(#function)")
        let menuCellIdentifier = menuCellIdentifiers[indexPath.row]
        var height = rowHeight
        switch menuCellIdentifier {
        case "searchCellMenuID":
            height = 48.0
            break
        case "settingsCellMenuID":
            height = 80.0
            break
        case "arcadeCellMenuID":
            height = 165.0
            break
        case "laserTrainingCellMenuID":
            height = 165.0
            break
        case "gettingStartingCellMenuID":
            height = 165.0
            break
        default:
            break
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuCellIdentifiers.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("MenuViewController: \(#function)")
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        self.onCloseMenuClick(btn)
    }
    
    // MARK: menu's buttons actions
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        print("MenuViewController: \(#function)")
       // TODO: BaseViewController.shared.openViewControllerBasedOnIdentifier("SettingsViewControllerID")
    }
    
    
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        print("MenuViewController: \(#function)")
    }
    
}
