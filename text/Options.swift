//
//  Options.swift
//  test2
//
//  Created by 김종국 on 2019/10/24.
//  Copyright © 2019 988KUK. All rights reserved.
//

import Foundation


func login(id: String) {
    print(id)
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "c"), object: nil)
    //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "c"), object: nil, userInfo: userInfo)
}
