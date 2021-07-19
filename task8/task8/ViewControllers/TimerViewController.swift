//
//  TimerViewController.swift
//  task8
//
//  Created by Маргарита Жучик on 19.07.21.
//

import UIKit

@objc public class TimerViewController: UIViewController {

    @IBOutlet weak var saveButton: AButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @objc weak public var delegate:TimerDelegate?
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.view.layer.cornerRadius = 40
        self.view.backgroundColor = .white
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowRadius = 4
        self.view.layer.shadowOffset  = .zero
        self.view.layer.shadowOpacity = 0.25
        self.view.layer.masksToBounds = false
        self.view.layer.shadowPath = UIBezierPath(roundedRect: self.view.bounds, cornerRadius: 40).cgPath
        
        self.timeLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
        self.minLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
        self.maxLabel.font = UIFont(name: "Montserrat-Regular", size: 18)
        
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.delegate?.saveTimerButtonTapped(slider.value)
    }

    @IBAction func sliderValueWasChanged(_ sender: UISlider) {
        timeLabel.text = String(format: "%.2f", sender.value) + " s"
    }
    
}
