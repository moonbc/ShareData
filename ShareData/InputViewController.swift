//
//  InputViewController.swift
//  ShareData
//
//  Created by 402-07 on 2018. 8. 5..
//  Copyright © 2018년 moonbc. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
 
    //최근 iOS에서는 싱글톤 패턴의 인스턴스들은 속성의 형태로 제공합니다.
    //예전에는 메소드를 호출해서 만들었는데 지금은 속성으로 제공
    
    
    var fileMgr : FileManager = FileManager.default
    //데이터를 저장할 디렉토리 경로와 파일 경로를 저장할 변수 생성
    var docsDir:String?
    var dataFile:String?
    
    
    
    @IBOutlet weak var tfAppDelegate: UITextField!
    @IBOutlet weak var tfUserDefaults: UITextField!
    
    @IBOutlet weak var tv: UITextView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        tfAppDelegate.text = appDelegate.msg
        
        let userDefaults = UserDefaults.standard
        
        if let msg = userDefaults.string(forKey: "msg") {
            
            tfUserDefaults.text = msg
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func prevViewController(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
       appDelegate.msg = tfAppDelegate.text!
        
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(tfUserDefaults.text, forKey: "msg")
        
        self.presentingViewController?.dismiss(animated: true
            , completion: {
                
        })
        
    }
    
    @IBAction func readFile(_ sender: Any) {
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        docsDir = dirPaths[0]
        
        //파일 경로 만들기
        dataFile = docsDir! + "/datafile.txt"
        
        if fileMgr.fileExists(atPath: dataFile!) == false {
            tv.text = "파일이 존재하지 않습니다."
        }else {
            
            let databuffer = fileMgr.contents(atPath: dataFile!)
            //Data는 String으로 변환이 바로 가능한데 가끔 오류가 발생하는 경우가
            //있어서 NSString 으로 변환한 후 String으로 변환
            let msg = NSString(data: databuffer!, encoding: String.Encoding.utf8.rawValue)
            tv.text = msg! as String
        }
        
        
    }
    
    @IBAction func writeFile(_ sender: Any) {
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        docsDir = dirPaths[0]
        
        //파일 경로 만들기
        dataFile = docsDir! + "/datafile.txt"
        
        //파일 경로 확인
        print(dataFile!)
        
        //문자열을 바이트 배열 - Data로 변경해서 파일에 기록
        let str = tv.text
        let databuffer = str!.data(using: String.Encoding.utf8)
        
        fileMgr.createFile(atPath: dataFile!, contents: databuffer, attributes: nil)
        
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
