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
    func openViewControllerBasedOnIdentifier(_ strIdentifier:String)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet var tblMenuOptions : UITableView!
    @IBOutlet var btnCloseMenuOverlay : UIButton!   // Transparent button to hide menu
    
    // Array containing menu cell's identifiers
    let menuCellIdentifiers = ["searchCellMenuID",
                               "settingsCellMenuID",
                               "arcadeCellMenuID",
                               "laserTrainingCellMenuID",
                               "gettingStartingCellMenuID"]
    
    var btnMenu : UIButton! // Menu button which was tapped to display the menu
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
        if indexPath.row == 3 {
            if let selectedCell = tableView.cellForRow(at: indexPath) {
                perform(#selector(MenuViewController.showMenuPopover(_:)), with: selectedCell, afterDelay: 0.01)
            }
        } else {
            delegate?.slideMenuItemSelectedAtIndex(Int32(indexPath.row))
            let btn = UIButton(type: UIButtonType.custom)
            btn.tag = indexPath.row
            self.onCloseMenuClick(btn)
        }
    }
    
    func showMenuPopover(_ selectedCell: UITableViewCell) {
        print("BaseViewController: \(#function)")
        // get a reference to the view controller for the popover
        if let popoverContent = appDelegate.storyboard.instantiateViewController(withIdentifier: "TrainingPopoverMenuID") as? TrainingPopoverMenuController {
            
            popoverContent.modalPresentationStyle = UIModalPresentationStyle.popover
            popoverContent.preferredContentSize = CGSize(width: screen.width / 2, height: screen.height / 3.2)
            
            // set up the popover presentation controller
            if let popoverPresentationController = popoverContent.popoverPresentationController {
                popoverPresentationController.sourceView = self.view
                popoverPresentationController.sourceRect = selectedCell.frame
                popoverPresentationController.delegate = self
                popoverPresentationController.permittedArrowDirections = .left
                self.present(popoverContent, animated: false, completion: nil)
            }
        }
    }
    
    // MARK: UIPopoverPresentationControllerDelegate method
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        print("MenuViewController: should dismiss")
        return true
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("MenuViewController: \(#function)")
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        print("MenuViewController: \(#function)")
        return .none
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        print("MenuViewController: \(#function)")
        return .none
    }
    
    //    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
    //        print("prepare for presentation")
    //    }
    
    // MARK: menu's buttons actions
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        print("MenuViewController: \(#function)")
        delegate?.openViewControllerBasedOnIdentifier("SettingsViewControllerID")
    }
    
    
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        print("MenuViewController: \(#function)")
        delegate?.openViewControllerBasedOnIdentifier("ProfileViewControllerID")
    }
    
}
