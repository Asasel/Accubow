//
//  SettingsViewController.swift
//  Accubow
//
//  Created by Ангелина Латаш on 30/01/2017.
//  Copyright © 2017 Ангелина Латаш. All rights reserved.
//

import UIKit

class SettingsViewController: BaseViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        print("SettingsViewController: \(#function)")
    }
    
    override func viewDidLoad() {
        print("SettingsViewController: \(#function)")
        super.viewDidLoad()
        addSlideMenuButton()
    }
    
    override func didReceiveMemoryWarning() {
        print("SettingsViewController: \(#function)")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
