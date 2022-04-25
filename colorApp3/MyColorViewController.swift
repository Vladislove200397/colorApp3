//
//  MyColorViewController.swift
//  colorApp3
//
//  Created by Vlad Kulakovsky  on 20.04.22.
//

import UIKit
protocol MyColorViewControllerDelegate: AnyObject {
    func update(color: UIColor)
}
class MyColorViewController: UIViewController {
    

    @IBOutlet weak var labelRed: UILabel!
    @IBOutlet weak var labelGreen: UILabel!
    @IBOutlet weak var labelBlue: UILabel!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    
    @IBOutlet weak var textFieldRed: UITextField!
    @IBOutlet weak var textFieldGreen: UITextField!
    @IBOutlet weak var textFieldBlue: UITextField!
    
    weak var delegate: MyColorViewControllerDelegate!

    @IBOutlet weak var mainView: UIView!
    
    
    var mainViewColor: UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        mainView.backgroundColor = mainViewColor
        
        setSliders()
        setValue(for: textFieldRed, textFieldGreen, textFieldBlue)
        setValue(for: labelRed, labelGreen, labelBlue)
        addDoneButton(to: textFieldRed, textFieldGreen, textFieldBlue)
    }
    

        
    @IBAction func slidersUpdate(_ sender: UISlider) {
        
    switch sender.tag {
        case 0:
            setValue(for: labelRed)
            setValue(for: textFieldRed)
        case 1:
            setValue(for: labelGreen)
            setValue(for: textFieldGreen)
        case 2:
            setValue(for: labelBlue)
            setValue(for: textFieldBlue)
        default:
            break
        }
        updateViewColor()
    }

  @IBAction  func cahngeColor() {
       delegate?.update(color: mainView.backgroundColor ?? .blue)
       dismiss(animated: true)
      }
}

extension MyColorViewController {
    
         private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: labelRed.text = string(from: sliderRed)
            case 1: labelGreen.text = string(from: sliderGreen)
            case 2: labelBlue.text = string(from: sliderBlue)
            default:break
            }
        }
     }
         private func setValue(for textFields: UITextField...) {
             textFields.forEach { textField in
             switch textField.tag {
             case 0: textFieldRed.text = string(from: sliderRed)
             case 1: textFieldGreen.text = string(from: sliderGreen)
             case 2: textFieldBlue.text = string(from: sliderBlue)
             default:break
             }
        }
    }
         private func setSliders() {
            let ciColor = CIColor(color: mainViewColor)
            
            sliderRed.value = Float(ciColor.red)
            sliderGreen.value = Float(ciColor.green)
            sliderBlue.value = Float(ciColor.blue)
            print(Float(ciColor.red),
                  Float(ciColor.green),
                  Float(ciColor.blue))
        }
    
    private func string(from slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    func updateViewColor() {
            
        mainView.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1)
        }
    
    private func addDoneButton(to textFields: UITextField...) {
            
            textFields.forEach { textField in
                let keyboardToolbar = UIToolbar()
                textField.inputAccessoryView = keyboardToolbar
                keyboardToolbar.sizeToFit()
                
                let doneButton = UIBarButtonItem(
                    title:"Done",
                    style: .done,
                    target: self,
                    action: #selector(didTapDone)
                )
                
                let flexBarButton = UIBarButtonItem(
                    barButtonSystemItem: .flexibleSpace,
                    target: nil,
                    action: nil
                )
                
                keyboardToolbar.items = [flexBarButton, doneButton]
            }
        }
        
    @objc private func didTapDone() {
            view.endEditing(true)
        }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}

extension MyColorViewController: UITextFieldDelegate {
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue2 = Float(text), currentValue2  <= 1 {
            switch textField.tag {
            case 0: sliderRed.setValue(currentValue2, animated: true)
                setValue(for: labelRed)
            
            case 1: sliderGreen.setValue(currentValue2, animated: true)
                setValue(for: labelGreen)
            
             case 2: sliderBlue.setValue(currentValue2, animated: true)
                setValue(for: labelBlue)
            default: break
            }
            updateViewColor()
            return
           }
        showAlert(title: "ok", message: "gg")
      }
   }

