//
//  File.swift
//  task8
//
//  Created by Маргарита Жучик on 17.07.21.
//

import Foundation
import UIKit

class DrawingsListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationItems()
    }
    
    func setupNavigationItems() {
        self.navigationItem.title = "Drawings"
        self.navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 17)!], for: UIControl.State.normal)
        
    }
}
