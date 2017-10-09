//
//  MHCViewController.swift
//  wheel
//
//  Created by Nguyen Dinh Dung on 2017/09/29.
//  Copyright © 2017年 Nguyen Dinh Dung. All rights reserved.
//

import UIKit
import Toast_Swift

class MHCViewController: UIViewController {
    
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var txt2: UITextField!
    
    @IBAction func xnBtn(_ sender: Any) {
        if txt1.text != "" && txt2.text != "" 
        {
          performSegue(withIdentifier: "segue", sender: self)
        }
        else {
            self.view.makeToast("Bạn vui lòng nhập tên để xác nhận", duration: 2, position: .center)
        }
    }
    
    @IBAction func luat_choi(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: ViewController2  = storyboard.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        self.present(controller, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let secondController1 = segue.destination as! ViewController
        secondController1.mystring1 = txt1.text
        secondController1.mystring2 = txt2.text
        
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
