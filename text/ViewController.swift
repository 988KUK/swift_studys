//
//  ViewController.swift
//  test2
//
//  Created by 김종국 on 2019/10/24.
//  Copyright © 2019 988KUK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var textField = UITextField()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField = UITextField()
        textField.backgroundColor = .gray
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        textField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        textField.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        button = UIButton(type: .system)
        button.setTitle("abc", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(button_onClick), for: .touchUpInside)
        view.addSubview(button)
        button.topAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(noticeGet), name: NSNotification.Name(rawValue: "b"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(logined), name: NSNotification.Name(rawValue: "c"), object: nil)
    }
    
    @objc func button_onClick() {
        guard let text = textField.text else {
            return
        }
////        print(text)
////        button.setTitle(text, for: .normal)
//
//        let userInfo:[String:Any] = [
//            "text" : text
//        ]
//
//        let viewController = PopViewController()
//        viewController.inputText = text
//        present(viewController, animated: true, completion: nil)
//        present(viewController, animated: true) {
////            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "a"), object: nil)
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "a"), object: nil, userInfo: userInfo)
        
        
//        }
        
        login(id: text)
    }

    @objc func noticeGet(_ sender : NSNotification) {
        guard let userInfo = sender.userInfo as? [String:Any],
            let text = userInfo["text"] as? String else {
            return
        }
        
        textField.text = text
    }

    
    @objc func logined(_ sender : NSNotification) {
        //textField.text = "login complete"
        
        guard let text = textField.text else {
            return
        }
        
        let viewController = PopViewController()
        viewController.inputText = text
        present(viewController, animated: true, completion: nil)
    }
}

