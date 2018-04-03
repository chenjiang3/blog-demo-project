//
//  RxSwiftViewController.swift
//  RxSwiftDemo
//
//  Created by chenjiang on 2018/4/3.
//  Copyright © 2018年 chenjiang. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class RxSwiftViewController: UIViewController {
    
    lazy var button: UIButton = {
        let btn: UIButton = UIButton(type: .custom)
        btn.setTitle("button", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.addTarget(self, action: #selector(onClicked(_:)), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        self.view.addSubview(self.button)
        self.button.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func onClicked(_ sender: Any?) {
        print("onClicked")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
