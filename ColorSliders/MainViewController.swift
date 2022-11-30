//
//  MainViewController.swift
//  ColorSliders
//
//  Created by Роман Бакаев on 28.11.2022.
//

import UIKit


protocol ColorViewControllerDelegate {
    func setNewColors ( _ red: Float, _ green: Float, _ blue: Float)
}

class MainViewController: UIViewController {

    @IBOutlet var colorView: UIView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    func setNewColors(_ red: Float, _ green: Float, _ blue: Float) {
        colorView.backgroundColor = UIColor (redColorSlider.value, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
    }
    
    
}
