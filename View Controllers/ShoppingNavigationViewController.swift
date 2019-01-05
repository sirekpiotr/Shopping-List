//
//  ShoppingNavigationViewController.swift
//  Shopping List
//
//  Created by Piotr Sirek on 01/01/2019.
//  Copyright © 2019 Piotr Sirek. All rights reserved.
//

import UIKit

class ShoppingNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.prefersLargeTitles = true
    }
}
