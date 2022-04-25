//
//  ViewController.swift
//  colorApp3
//
//  Created by Vlad Kulakovsky  on 20.04.22.
//

import UIKit

class ViewController: UIViewController {
    
    var viewControllerColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! MyColorViewController
        destination.delegate = self
        destination.mainViewColor = view.backgroundColor
    }
}
    extension ViewController: MyColorViewControllerDelegate {
    func update(color: UIColor) {
        view.backgroundColor = color
    }
    
}
