//
//  ColorViewController.swift
//  ColorSliders
//
//  Created by Роман Бакаев on 25.05.2022.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet var colorView: UIView!
    
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    @IBOutlet var redTFValue: UITextField!
    @IBOutlet var greenTFValue: UITextField!
    @IBOutlet var blueTFValue: UITextField!
    
    var mainColorView: UIColor!
    var delegate: ColorViewControllerDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTFValue.delegate = self
        greenTFValue.delegate = self
        blueTFValue.delegate = self
        
        
        colorView.layer.cornerRadius = 15
        
        
        
        redColorSlider.tintColor = .red
        greenColorSlider.tintColor = .green
        
        colorView.backgroundColor = mainColorView
        
        setSliders()
        setValue(for: redLabel, greenLabel, blueLabel )
        setValue(for: redTFValue, greenTFValue, blueTFValue)
        
        
    }

    @IBAction func rgbSlider(_ sender: UISlider) {
        
        switch sender {
        case redColorSlider:
            setValue(for: redLabel)
            setValue(for: redTFValue)
        case greenColorSlider:
            setValue(for: greenLabel)
            setValue(for: greenTFValue)
        default:
            setValue(for: blueLabel)
            setValue(for: blueTFValue)
            
        }
        
        setColor()
        
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColors(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}


//MARK: Private Methods
extension ColorViewController {
    
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value),
                                            green: CGFloat(greenColorSlider.value),
                                            blue: CGFloat(blueColorSlider.value),
                                            alpha: 1
        )
    }
    
    private func setValue (for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel: label.text = string(from: redColorSlider)
            case greenLabel: label.text = string(from:greenColorSlider)
            default: label.text = string(from:blueColorSlider)
            }
            
        }
        
    }
    
    private func setValue (for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTFValue: textField.text = string(from: redColorSlider)
            case greenTFValue :textField.text = string(from: greenColorSlider)
            default: textField.text = string(from:blueColorSlider)
            }
           
    }
    
}
    private func setSliders() {
        let ciColor = CIColor(color: mainColorView)
        
        redColorSlider.value = Float(ciColor.red)
        greenColorSlider.value = Float(ciColor.green)
        blueColorSlider.value = Float(ciColor.blue)
    }
    
    //Значения RGB
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }

    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert( title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert,animated: true)
    }
    
}

// Mark: - UITextfieldDelegate
extension ColorViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        if let currentValue = Float(text) {
            switch textField {
            case redTFValue:
                redColorSlider.setValue(currentValue, animated: true)
                setValue(for: redLabel)
            case greenTFValue:
                greenColorSlider.setValue(currentValue, animated: true)
                setValue(for: greenLabel)
            default:
                blueColorSlider.setValue(currentValue, animated: true)
                setValue(for: blueLabel)
            }
            setColor()
            return
        }
        showAlert(title: "Wrong format!", message: "Please enter correct value")
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyBoardToolbar = UIToolbar()
        keyBoardToolbar.sizeToFit()
        textField.inputAccessoryView = keyBoardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        keyBoardToolbar.items = [flexBarButton, doneButton]
}
}
