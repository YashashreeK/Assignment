//
//  ViewController.swift
//  AssignmentApp
//
//  Created by Yashashree on 03/05/22.
//

import UIKit
import Assignment


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Assignment.launchCrypto(with: UIApplication.shared.windows.first!)
    }


}

