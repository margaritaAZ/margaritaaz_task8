//
//  File.swift
//  task8
//
//  Created by Маргарита Жучик on 17.07.21.
//

import Foundation
import UIKit

@objc class DrawingsListVC: UIViewController {
    enum Template: Int {
        case planet, head, tree, landscape
    }
    @IBOutlet weak var planetButton: DrawingTypeButton!
    @IBOutlet weak var headButton: DrawingTypeButton!
    @IBOutlet weak var treeButton: DrawingTypeButton!
    @IBOutlet weak var landscapeButton: DrawingTypeButton!
    @objc weak public var delegate:DrawningsListDelegate?
    
    public var selectedtemplate: Template?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch selectedtemplate {
        case .head:
            headButton.setSelected(true)
        case .landscape:
            landscapeButton.setSelected(true)
        case .planet:
            planetButton.setSelected(true)
        case .tree:
            treeButton.setSelected(true)
        case .none:
            headButton.setSelected(true)
            selectedtemplate = .head
        }
    }
    
    @IBAction func planetButtonTapped(_ sender: DrawingTypeButton) {
        selectTemplate(.planet)
    }
    
    @IBAction func headButtonTapped(_ sender: DrawingTypeButton) {
        selectTemplate(.head)
    }
    
    @IBAction func treeButtonTapped(_ sender: DrawingTypeButton) {
        selectTemplate(.tree)
    }
    
    @IBAction func landscapeButtonTapped(_ sender: DrawingTypeButton) {
        selectTemplate(.landscape)
        
    }
    
    @objc
    public func setSelectedTemplate (_ template: Int){
        selectedtemplate = Template(rawValue: template)
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
        self.navigationController?.popToRootViewController(animated: true)
    }
}
