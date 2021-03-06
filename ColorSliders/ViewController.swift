//
//  ViewController.swift
//  ColorSliders
//
//  Created by Роман Бакаев on 25.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 15
        
        redSliderValue.text = String(redColorSlider.value)
        greenSliderValue.text = String(greenColorSlider.value)
        blueSliderValue.text = String(blueColorSlider.value)
        
        
    }

    @IBAction func redSliderAction() {
        
        redSliderValue.text = String(format: "%.1f", redColorSlider.value)
        changeColor()
        
    }
    
    @IBAction func GreenSliderAction() {
        greenSliderValue.text = String(format: "%.1f",greenColorSlider.value)
        changeColor()
    }
    
    @IBAction func blueSliderAction() {
        blueSliderValue.text = String(format: "%.1f",blueColorSlider.value)
        changeColor()
    }
    func changeColor () {
        mainView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
        

    }
    }

