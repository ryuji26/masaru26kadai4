//
//  CounterViewController.swift
//  kadai4
//
//  Created by 髙橋　竜治 on 2021/06/19.
//

import UIKit

class CounterViewController: UIViewController {
    // ViewとModelの参照を保持する
    @IBOutlet private var counterView: ViewController!
    private(set) lazy var counterModel = CounterModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Modelの変更を監視する
        counterModel.notificationCenter.addObserver(
            self,
            selector: #selector(self.handleCountChange(_:)),
            name: .init(NSNotification.Name(rawValue: CounterModel.notificationName)), object: nil
        )
    }

    // 変更を検知する
    @objc func handleCountChange(_ notification: Notification) {
        if let count = notification.object as? Int {
            // Viewに描画処理を依頼する
            counterView.render(count: count)
        }
    }

    // 入力を受け付ける
    @IBAction private func onPlusButtonTapped(_ sender: Any) {
        // Modelに処理を依頼する
        counterModel.countUp()
    }

    @IBAction private func onClearButtonTapped(_ sender: Any) {
        counterModel.countClear()
    }
}
