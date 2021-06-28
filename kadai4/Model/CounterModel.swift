//
//  CounterModel.swift
//  kadai4
//
//  Created by 髙橋　竜治 on 2021/06/19.
//

import Foundation

class CounterModel {
    static let notificationName = "CounterModelChange"

    let notificationCenter = NotificationCenter()

    // データの保存
    internal var count: Int = 0 {
        didSet {
            // Modelを監視しているコントローラーに変更を通知する
            notificationCenter.post(
                name: .init(rawValue: CounterModel.notificationName),
                object: count
            )
        }
    }
    // データの保持
    func countUp() { count += 1 }
    func countClear() { count = 0 }
}
