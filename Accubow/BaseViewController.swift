//
//  GettingStartedViewController.swift
//  Accubow
//
//  Created by Ангелина Латаш on 30/01/2017.
//  Copyright © 2017 Ангелина Латаш. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, SlideMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        print("BaseViewController: \(#function)")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        print("BaseViewController: \(#function)")
        let topViewController : UIViewController = self.navigationController!.topViewController!
        print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
        case 2:
            print("arcade\n", terminator: "")
            self.openViewControllerBasedOnIdentifier("ArcadeID")
            break
        case 3:
            print("LaserTraining\n", terminator: "")
            break
        case 4:
            print("GettingStarted\n", terminator: "")
            self.openViewControllerBasedOnIdentifier("GettingStartedID")
            break
        default:
            print("default\n", terminator: "")
        }
    }
    
    func openViewControllerBasedOnIdentifier(_ strIdentifier:String) {
        let destViewController = appDelegate.storyboard.instantiateViewController(withIdentifier: strIdentifier)
        
        if let topViewController = self.navigationController?.topViewController {
            print("topViewController = \(topViewController.restorationIdentifier)")
            if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
                print("Same VC")
            } else {
                print("Going to \(destViewController.restorationIdentifier)")
                self.navigationController?.pushViewController(destViewController, animated: true)
            }
        }
    }
    
    func addSlideMenuButton() {
        let btnShowMenu = UIButton(type: UIButtonType.system)
        btnShowMenu.setImage(self.defaultMenuImage(), for: UIControlState())
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnShowMenu.addTarget(self, action: #selector(BaseViewController.onSlideMenuButtonPressed(_:)), for: UIControlEvents.touchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem
    }

    func defaultMenuImage() -> UIImage {
        var defaultMenuImage = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)
        
        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
        
        UIColor.white.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
        
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
       
        return defaultMenuImage;
    }
    
    func onSlideMenuButtonPressed(_ sender : UIButton) {
        print("BaseViewController: \(#function)")
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            
            sender.tag = 0;
            if view.subviews.last != nil {
                if let viewMenuBack = view.subviews.last {
                UIView.animate(withDuration: 0.3, animations: { () -> Void in
                    var frameMenu : CGRect = viewMenuBack.frame
                    frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                    viewMenuBack.frame = frameMenu
                    viewMenuBack.layoutIfNeeded()
                    viewMenuBack.backgroundColor = UIColor.clear
                }, completion: { (finished) -> Void in
                    viewMenuBack.removeFromSuperview()
                })
                }
                return
            } else {
                return
            }
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        if let menuVC = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController {
            menuVC.btnMenu = sender
            menuVC.delegate = self
            self.view.addSubview(menuVC.view)
            self.addChildViewController(menuVC)
            menuVC.view.layoutIfNeeded()
            
            
            menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
                sender.isEnabled = true
                }, completion:nil)
        }
    }
}
