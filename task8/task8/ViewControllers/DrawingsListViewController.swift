//
//  File.swift
//  task8
//
//  Created by Маргарита Жучик on 17.07.21.
//

import Foundation
import UIKit



class DrawingsListVC: UIViewController {
    enum Template: Int {
        case planet, head, tree, landscape
    }
    @IBOutlet weak var planetButton: AButton!
    @IBOutlet weak var headButton: AButton!
    @IBOutlet weak var treeButton: AButton!
    @IBOutlet weak var landscapeButton: AButton!
    @objc weak public var delegate:DrawningsListDelegate?
    var selectedtemplate: Template?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectTemplate(selectedtemplate ?? .head)
    }
    
    @IBAction func planetButtonTapped(_ sender: AButton) {
        selectTemplate(.planet)
    }
    
    @IBAction func headButtonTapped(_ sender: AButton) {
        selectTemplate(.head)
    }
    
    @IBAction func treeButtonTapped(_ sender: AButton) {
        selectTemplate(.tree)
    }
    
    @IBAction func landscapeButtonTapped(_ sender: AButton) {
        selectTemplate(.landscape)
        
    }
    
    func selectTemplate (_ template: Template) {
        switch selectedtemplate {
        case .head:
            headButton.setSelected(false)
        case .landscape:
            landscapeButton.setSelected(false)
        case .planet:
            planetButton.setSelected(false)
        case .tree:
            treeButton.setSelected(false)
        case .none: break
        }
        
        switch template {
        case .head:
            headButton.setSelected(true)
        case .landscape:
            landscapeButton.setSelected(true)
        case .planet:
            planetButton.setSelected(true)
        case .tree:
            treeButton.setSelected(true)
        }
        selectedtemplate = template
        self.delegate?.selectedDrawning(selectedtemplate?.rawValue ?? 1)
    }
}
