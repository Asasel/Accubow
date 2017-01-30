//
//  LaserTrainingViewController.swift
//  Accubow
//
//  Created by Ангелина Латаш on 30/01/2017.
//  Copyright © 2017 Ангелина Латаш. All rights reserved.
//

import UIKit

class LaserTrainingViewController: BaseViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        print("LaserTrainingViewController: \(#function)")
    }
    
    override func viewDidLoad() {
        print("LaserTrainingViewController: \(#function)")
        super.viewDidLoad()
        addSlideMenuButton()
    }
    
    override func didReceiveMemoryWarning() {
        print("LaserTrainingViewController: \(#function)")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
