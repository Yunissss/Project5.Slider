//
//  ViewController.swift
//  3-Slider Uygulamasi
//
//  Created by Furkan Sabaz on 31.12.2018.
//  Copyright © 2018 Furkan Sabaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblValidFilter: UILabel!
    
    @IBOutlet weak var imgResult: UIImageView!
    
    @IBOutlet weak var slider: UISlider!
    
    
    enum FilterMode : Float {
        case money = 0.0
        case all = 5.0
        case gold = 10.0
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        let fixed = roundf(sender.value / 5.0) * 5.0
        sender.setValue(fixed, animated: true)
        filtre()
    }
    
    func filtre() {
        
        guard let mode = FilterMode(rawValue: slider.value) else {
            lblValidFilter.text = "All"
            changeDisplay(name: "goldAndMoney")
            return
        }
        
        switch mode {
            
        case FilterMode.all :
            lblValidFilter.text = "All"
            changeDisplay(name: "goldAndMoney")
        case FilterMode.money :
            lblValidFilter.text = "Money"
            changeDisplay(name: "money")
        case FilterMode.gold :
            lblValidFilter.text = "Gold"
            changeDisplay(name: "gold")
        }
        
        
        
    }
    
    
    
    func changeDisplay(name : String) {
        guard let image = UIImage(named: name)  else {
            imgResult?.image = nil
            return
        }
        
        imgResult?.image = image
        
    }
}

