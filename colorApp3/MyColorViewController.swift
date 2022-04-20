//
//  MyColorViewController.swift
//  colorApp3
//
//  Created by Vlad Kulakovsky  on 20.04.22.
//

import UIKit
protocol MyColorViewControllerDelegate: AnyObject{
    func update(color: UIColor)
}
class MyColorViewController: UIViewController{
    
    @IBOutlet var labelRed: UILabel!
    @IBOutlet var labelGreen: UILabel!
    @IBOutlet var labelBlue: UILabel!
    
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    
    @IBOutlet var textFieldRed: UITextField!
    @IBOutlet var textFieldGreen: UITextField!
    @IBOutlet var textFieldBlue: UITextField!
    weak var delegate: ViewControllerDelegate?

    @IBOutlet weak var mainView: UIView!
    
    
    var mainViewColor = UIColor(red: 0/255,
                                green: 0/255,
                                blue: 0/255,
                                alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderRed.minimumTrackTintColor = .red
        sliderGreen.minimumTrackTintColor = .green
        labelRed.text = "0"
        labelBlue.text = "0"
        labelGreen.text = "0"
        mainView.backgroundColor = mainViewColor
        
    }
    
    @IBAction func sliderUpdate(_ sender: Any) {
        updateViewColor()
        updateLabelValue()
        updateTextFieldsValue()
    }
     func updateLabelValue() {
        labelRed.text = String(Int(sliderRed.value))
        labelBlue.text = String(Int(sliderBlue.value))
        labelGreen.text = String(Int(sliderGreen.value))
    }
    func updateTextFieldsValue(){
        textFieldRed.text = String(Int(sliderRed.value))
        textFieldBlue.text = String(Int(sliderBlue.value))
        textFieldGreen.text = String(Int(sliderGreen.value))
    }
        func updateViewColor() {
            
            mainViewColor = UIColor(red: CGFloat(sliderRed.value)/255,
                                    green: CGFloat(sliderGreen.value)/255,
                                    blue: CGFloat(sliderBlue.value)/255,
                                    alpha: 1)
            mainView.backgroundColor = mainViewColor
        }
    
  
    @IBAction func cahngeColor() {
        delegate?.update(color: mainViewColor)
        dismiss(animated: true)
    }
    
}
