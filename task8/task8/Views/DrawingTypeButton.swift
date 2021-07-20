//
//  DrawingTypeButton.swift
//  task8
//
//  Created by Маргарита Жучик on 20.07.21.
//

import UIKit

class DrawingTypeButton: UIButton {
    
    override var isHighlighted: Bool {
            get {
                return super.isHighlighted
            }
            set {
                if newValue {
                    self.layer.shadowColor = UIColor(named: "Light Green Sea")?.cgColor
                    self.layer.shadowRadius = 2
                    self.layer.shadowOpacity = 1
                }
                else {
                    self.layer.shadowColor = UIColor.black.cgColor
                    self.layer.shadowRadius = 1
                    self.layer.shadowOpacity = 0.25
                }
                super.isHighlighted = newValue
            }
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.titleLabel?.font = UIFont(name: "Montserrat-Medium", size: 18)
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
        
        setDefaultState()
        self.layer.shadowOffset  = .zero
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
    }
    
    func setDefaultState () {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 0.25
    }
    
    func setSelected(_ selected: Bool) {
        if (selected) {
            self.layer.shadowColor = UIColor(named: "Light Green Sea")?.cgColor
            self.layer.shadowRadius = 2
            self.layer.shadowOpacity = 1
        } else {
            setDefaultState()
       }
    }
    

}
