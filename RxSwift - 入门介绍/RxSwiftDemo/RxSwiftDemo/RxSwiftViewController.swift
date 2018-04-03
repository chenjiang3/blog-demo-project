//
//  RxSwiftViewController.swift
//  RxSwiftDemo
//
//  Created by chenjiang on 2018/4/3.
//  Copyright © 2018年 chenjiang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class RxSwiftViewController: UIViewController {
    
    lazy var button: UIButton = {
        let btn: UIButton = UIButton(type: .custom)
        btn.setTitle("button", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.addTarget(self, action: #selector(onClicked(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var button2: UIButton = {
        let btn: UIButton = UIButton(type: .custom)
        btn.setTitle("button2", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        return btn
    }()
    
    lazy var disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        self.view.addSubview(self.button)
        self.button.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
        
        self.view.addSubview(self.button2)
        self.button2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.button.snp.bottom).offset(20)
        }
        
        button2.rx.tap
            .subscribe(onNext: { (e) in
                print(e)
            }).disposed(by: self.disposeBag)
    }
    
    @objc func onClicked(_ sender: Any?) {
        let observable = Observable<String>.create { (observer) -> Disposable in
            observer.on(Event.next("HelloWorld！"))
            observer.onCompleted()
            
            return Disposables.create()
        }
        
        let disposeBag = DisposeBag()
        
        observable.subscribe(onNext: { (str) in
            print(str)
        }, onError: { (error) in
            
        }, onCompleted: {
            
        }).disposed(by: disposeBag)
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
