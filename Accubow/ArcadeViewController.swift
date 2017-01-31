//
//  ArcadeViewController.swift
//  Accubow
//
//  Created by Ангелина Латаш on 31/01/2017.
//  Copyright © 2017 Ангелина Латаш. All rights reserved.
//

import UIKit

class ArcadeViewController: BaseViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        print("ArcadeViewController: \(#function)")
    }
    
    override func viewDidLoad() {
        print("ArcadeViewController: \(#function)")
        super.viewDidLoad()
        addSlideMenuButton()
    }
    
    override func didReceiveMemoryWarning() {
        print("ArcadeViewController: \(#function)")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
