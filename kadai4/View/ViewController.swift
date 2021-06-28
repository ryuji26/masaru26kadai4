//
//  ViewController.swift
//  kadai4
//
//  Created by 髙橋　竜治 on 2021/06/19.
//

import Foundation
import UIKit

class ViewController: UIView {

    @IBOutlet weak var countLabel: UILabel!
    public func render(count: Int){
        countLabel.text = String(count)
    }
}

