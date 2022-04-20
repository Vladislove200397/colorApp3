//
//  ViewController.swift
//  colorApp3
//
//  Created by Vlad Kulakovsky  on 20.04.22.
//

import UIKit
protocol ViewControllerDelegate: AnyObject{
    func update(color: UIColor)
}
class ViewController: UIViewController,ViewControllerDelegate {
    
    var viewControllerColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? MyColorViewController else { return }
        destination.delegate = self
    }
    
    
    func update(color: UIColor) {
        view.backgroundColor = color
    }
    
}
