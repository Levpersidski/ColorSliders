//
//  MainViewController.swift
//  ColorSliders
//
//  Created by Роман Бакаев on 28.11.2022.
//

import UIKit


protocol ColorViewControllerDelegate {
    func setNewColors ( _ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat)
}

class MainViewController: UIViewController {

    @IBOutlet var colorView: UIView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else {return}
        colorVC.mainColorView = colorView.backgroundColor!
        colorVC.delegate.self
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MainViewController: ColorViewControllerDelegate {
    func setNewColors(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) {
        let alpha:CGFloat =  1
        colorView.backgroundColor?.getRed(red, green: green, blue: blue, alpha: alpha)
    }
    
    }
    
    

