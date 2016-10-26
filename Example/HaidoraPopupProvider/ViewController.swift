//
//  ViewController.swift
//  HaidoraPopupProvider
//
//  Created by mrdaios on 09/17/2016.
//  Copyright (c) 2016 mrdaios. All rights reserved.
//

import UIKit
import HaidoraPopupProvider

class ViewController: UIViewController, Popupabel {

    var showCustom = false
    
    var popupProvider: PopupProvider.Type? {
        return  showCustom ? MMPopupViewSwiftWrap.self : nil
    }
    
    
    @IBAction func show(_ sender: AnyObject) {
        showCustom = false
        self.alert(title: "标题", message: "内容", items: "取消") { (index) in
            print("index-\(index)")
        }
    }
    
    @IBAction func customShow(_ sender: AnyObject) {
        showCustom = true
        self.alert(title: "标题", message: "内容", items: "取消","确定") { (index) in
            print("index-\(index)")
        }
    }
}

