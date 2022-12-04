//
//  MainViewController.swift
//  ColorSliders
//
//  Created by Роман Бакаев on 28.11.2022.
//

import UIKit


protocol ColorViewControllerDelegate {
    func setNewColors ( _ color: UIColor)
}

class MainViewController: UIViewController{

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let colorVC = segue.destination as? ColorViewController else {return}
        colorVC.mainColorView = view.backgroundColor!
        colorVC.delegate = self
        
    }
}

extension MainViewController: ColorViewControllerDelegate {
    func setNewColors(_ color : UIColor)  {
        view.backgroundColor = color

    }
    
    }
    
    

