//
//  ProfileViewController.swift
//  Accubow
//
//  Created by Ангелина Латаш on 31/01/2017.
//  Copyright © 2017 Ангелина Латаш. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        print("ProfileViewController: \(#function)")
    }
    
    override func viewDidLoad() {
        print("ProfileViewController: \(#function)")
        super.viewDidLoad()
        addSlideMenuButton()
    }
    
    override func didReceiveMemoryWarning() {
        print("ProfileViewController: \(#function)")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
