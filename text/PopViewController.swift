//
//  PopViewController.swift
//  test2
//
//  Created by 김종국 on 2019/10/24.
//  Copyright © 2019 988KUK. All rights reserved.
//

import UIKit

class PopViewController: UIViewController {
    
    var inputText = "cccc"
    var textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        
        textField = UITextField()
        textField.backgroundColor = .gray
        textField.text = inputText
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        textField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        textField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        textField.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        let button = UIButton(type: .system)
        button.setTitle("abc", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(button_onClick), for: .touchUpInside)
        view.addSubview(button)
        button.topAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(noticeGet), name: NSNotification.Name(rawValue: "a"), object: nil)
    }
    
    @objc func button_onClick() {
        guard let text = textField.text else {
            return
        }
        dismiss(animated: true) {

            let userInfo:[String:Any] = [
                "text" : text
            ]
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "b"), object: nil, userInfo: userInfo)
        }
    }

    @objc func noticeGet(_ sender : NSNotification) {
        guard let userInfo = sender.userInfo as? [String:Any],
            let text = userInfo["text"] as? String else {
            return
        }
        
        textField.text = text
    }
    


}

