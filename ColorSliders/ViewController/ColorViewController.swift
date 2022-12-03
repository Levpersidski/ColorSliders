//
//  ColorViewController.swift
//  ColorSliders
//
//  Created by Роман Бакаев on 25.05.2022.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet var mainView: UIView!

    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    @IBOutlet var redTFValue: UITextField!
    @IBOutlet var greenTFValue: UITextField!
    @IBOutlet var blueTFValue: UITextField!
    
    var mainColorView = UIColor()
    var delegate: ColorViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 15

        redTFValue.delegate = self
        greenTFValue.delegate = self
        blueTFValue.delegate = self
        
        redColorSlider.value = Float(mainColorView.rgba.red)
        greenColorSlider.value = Float(mainColorView.rgba.green)
        blueColorSlider.value = Float(mainColorView.rgba.blue)
        
        redSliderAction()
        GreenSliderAction()
        blueSliderAction()
        mainView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value),
                                           green: CGFloat(greenColorSlider.value),
                                           blue: CGFloat(blueColorSlider.value),
                                           alpha: 1)
        
        
    }

    @IBAction func redSliderAction() {
        
        redSliderValue.text = String(format: "%.1f", redColorSlider.value)
        redTFValue.text = String(format: "%.1f", redColorSlider.value)
    
        changeColor()
        
        
    }
    
    @IBAction func GreenSliderAction() {
        greenSliderValue.text = String(format: "%.1f",greenColorSlider.value)
        greenTFValue.text = String(format: "%.1f", greenColorSlider.value)
        changeColor()
    }
    
    @IBAction func blueSliderAction() {
        blueSliderValue.text = String(format: "%.1f",blueColorSlider.value)
        blueTFValue.text = String ( format: "%.1f", blueColorSlider.value)
        changeColor()
    }
    
   private func changeColor () {
       mainView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
        

    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColors(mainView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}

extension ColorViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text  else {return}
        guard let numberValue = Double(newValue)  else {showAlert(title: "please enter number from 0.0 to 1.0", message: "Try again")
            textField.text = "0.0"
            
            
            if textField == redTFValue {
                redColorSlider.value = Float(redTFValue.text ?? "0.0") ?? Float(0.0)
                view.endEditing(true)
                
            }
            ;return } 
    }
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "TRY AGAIN", style: .default) { _ in

        }
        alert.addAction(okAction)
        present(alert, animated: true)
        }
        
    }

extension ColorViewController {
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    
    view.endEditing(true)
}
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            view.endEditing(true)
        
        return true
     }
        
}


