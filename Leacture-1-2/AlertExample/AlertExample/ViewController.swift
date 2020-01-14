//
//  ViewController.swift
//  AlertExample
//
//  Created by 김광준 on 2020/01/14.
//  Copyright © 2020 VincentGeranium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpShowAlertButton(_ sender: UIButton) {
        self.showAlertController(style: UIAlertController.Style.alert)
    }
    
    @IBAction func touchUpShowActionSheetButton(_ sender: UIButton) {
        self.showActionSheet(style: UIAlertController.Style.actionSheet)
    }
    
    
    func showAlertController(style: UIAlertController.Style) {
        
        let alertController: UIAlertController
        alertController = UIAlertController(title: "Alert", message: "Message", preferredStyle: style)
        
        let okAction: UIAlertAction
        okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
            print("OK pressed")
        })
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let handler: (UIAlertAction) -> Void
        handler = { (action: UIAlertAction) in
            print("action pressed \(action.title ?? "")")
        }
        
        let someAction: UIAlertAction
        someAction = UIAlertAction(title: "Some", style: UIAlertAction.Style.destructive, handler: handler)
        
        let anotherAction: UIAlertAction
        anotherAction = UIAlertAction(title: "Another", style: UIAlertAction.Style.default , handler: handler)
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        alertController.addTextField { (field: UITextField) in
            field.placeholder = "플레이스 홀더"
            field.textColor = UIColor.red
        }
        self.present(alertController, animated: true) {
            print("Alert controller shown")
            
        }
    }
    
    func showActionSheet(style: UIAlertController.Style) {
        
        let alertController: UIAlertController
        alertController = UIAlertController(title: "ActionSheet", message: "Message", preferredStyle: style)
        
        let okAction: UIAlertAction
        okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action: UIAlertAction) in
            print("OK pressed")
        })
        
        let cancelAction: UIAlertAction
        cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let handler: (UIAlertAction) -> Void
        handler = { (action: UIAlertAction) in
            print("action pressed \(action.title ?? "")")
        }
        
        let someAction: UIAlertAction
        someAction = UIAlertAction(title: "Some", style: UIAlertAction.Style.destructive, handler: handler)
        
        let anotherAction: UIAlertAction
        anotherAction = UIAlertAction(title: "Another", style: UIAlertAction.Style.default , handler: handler)
        
        alertController.addAction(someAction)
        alertController.addAction(anotherAction)
        
        self.present(alertController, animated: true) {
            print("Alert controller shown")
            
        }
        
    }
}


