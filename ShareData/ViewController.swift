//
//  ViewController.swift
//  ShareData
//
//  Created by 402-07 on 2018. 8. 5..
//  Copyright © 2018년 moonbc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblUserDefaults: UILabel!
    @IBOutlet weak var lblAppDelegate: UILabel!
    
    //화면이 보여질 때 호출되는 메소드 재정의
    //오버라이딩 할 때 되도록이면 상위 클래스의 메소드를 호출하고
    //자신의 코드를 작성
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //AppDelegate에 대한 포인터 만들기
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        lblAppDelegate.text = appDelegate.msg
        
        
        //UserDefaults에 대한 포인터 만들기
        let userDefaults = UserDefaults.standard
        
        //UserDefaults에 저장한 내용을 출력
        
        if let msg = userDefaults.string(forKey: "msg") {
            lblUserDefaults.text = msg
        }
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moveInputController(_ sender: Any) {
        
        if let inputViewController = self.storyboard?.instantiateViewController(withIdentifier: "InputViewController") {
            self.present(inputViewController, animated: true)
        }
        
    }
    
}

