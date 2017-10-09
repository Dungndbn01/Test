//
//  phanThuong1.swift
//  wheel
//
//  Created by Nguyen Dinh Dung on 2017/10/01.
//  Copyright © 2017年 Nguyen Dinh Dung. All rights reserved.
//

import UIKit
import Toast_Swift
class phanThuong1: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var i: Int = 0
    var dem: Int = 0
    var j: Int = 0
    var x: Int = 0
    var y: Int = 0
    var z: Int = 0
    var m: Int = 0
    var n: Int = 0
    var o: Int = 0
    var so11: Int = 0
    var so21: Int = 0
    var so31: Int = 0
    var so1: Int = 0
    var so2: Int = 0
    var so3: Int = 0
    var loadString1: String = ""
    var loadString2: String = ""
    var loadInteger3: Int = 0
    var loadInteger4: Int = 0
    var loadInteger5: Int = 0
    var loadInteger6: Int = 0
    var loadInteger7: Int = 0
    var loadInteger8: Int = 0
    var loadInteger9: Int = 0
    var thamso1: Int = 0
    var thamso2: Int = 0
    var thamso3: Int = 0
    var timer, timer1, timer2, timer3: Timer!
    let array_dulieu: Array<Array<Int>> = [[1,2,3,4,5,6,7,8,9,10], [1,2,3,4,5,6,7,8,9,10], [1,2,3,4,5,6,7,8,9,10]]

    @IBOutlet weak var quay_jackpot: UIButton!
    @IBOutlet weak var check: UILabel!
    @IBOutlet weak var spin_txt: UILabel!
    @IBOutlet weak var spin_btn: UIButton!
    @IBOutlet weak var pickView: UIPickerView!
    @IBOutlet weak var jackpot_text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickView.delegate = self
        pickView.dataSource = self
        spin_btn.isEnabled = false
        so1  = Int(arc4random_uniform(10) )
        so2  = Int(arc4random_uniform(10) )
        so3  = Int(arc4random_uniform(10) )
        loadString1 = UserDefaults().string(forKey: "A_Name") ?? ""
        loadString2 = UserDefaults().string(forKey: "B_Name") ?? ""
        loadInteger3 = UserDefaults().integer(forKey: "aPoint")
        loadInteger4 = UserDefaults().integer(forKey: "bPoint")
        loadInteger9 = UserDefaults().integer(forKey: "bien_dem")
        loadInteger5 = UserDefaults().integer(forKey: "bien_demA")
        loadInteger6 = UserDefaults().integer(forKey: "bien_demB")
        loadInteger7 = UserDefaults().integer(forKey: "thamsoA")
        loadInteger8 = UserDefaults().integer(forKey: "thamsoB")
        pickView.selectRow(100 + so1, inComponent: 0, animated: true)
        pickView.selectRow(100 + so2, inComponent: 1, animated: true)
        pickView.selectRow(100 + so3, inComponent: 2, animated: true)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return array_dulieu.count }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array_dulieu[component].count * 1000
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch (row%10) {
            
        case 0: return String(array_dulieu[component][0])
        case 1: return String(array_dulieu[component][1])
        case 2: return String(array_dulieu[component][2])
        case 3: return String(array_dulieu[component][3])
        case 4: return String(array_dulieu[component][4])
        case 5: return String(array_dulieu[component][5])
        case 6: return String(array_dulieu[component][6])
        case 7: return String(array_dulieu[component][7])
        case 8: return String(array_dulieu[component][8])
        default: return String(array_dulieu[component][9])
        }
    }
    
    @IBAction func jack_pot(_ sender: Any) {
        spin_btn.isEnabled = true
        self.x = Int(arc4random_uniform(10)) + 1
        self.y = Int(arc4random_uniform(10)) + 1
        self.z = Int(arc4random_uniform(10)) + 1
        
        jackpot_text.text = String(x) + " , " + String(y) + " , " + String(z)
    }
    
    func runTimer1() {
    timer1 = Timer.scheduledTimer(timeInterval:0.1,
    target:self, selector:#selector(self.spin_run1),
    userInfo: nil,
    repeats: true) }
    
    func runTimer2() {
    timer2 = Timer.scheduledTimer(timeInterval:0.1,
    target:self, selector:#selector(self.spin_run2),
    userInfo: nil,
    repeats: true) }
    
    func runTimer3() {
    timer3 = Timer.scheduledTimer(timeInterval:0.1,
    target:self, selector:#selector(self.spin_run3),
    userInfo: nil,
    repeats: true) }
    
    func stopTimer1()
    {
     timer1.invalidate()
     timer1 = nil }
    
    func stopTimer2()
    {
        timer2.invalidate()
        timer2 = nil }
    
    func stopTimer3()
    {
        timer3.invalidate()
        timer3 = nil }
    
    func spin_run1() {
        so11 += 1
        pickView.selectRow(100 + so1 + so11, inComponent: 0, animated: true)
        if so11 >= thamso1 {self.stopTimer1()
        if thamso1 >= thamso2 && thamso1 >= thamso3 {
            self.hauxuly()
            spin_btn.isEnabled = true
            quay_jackpot.isEnabled = true     } }
    }
    func spin_run2() {
        so21 += 1
        pickView.selectRow(100 + so2 + so21, inComponent: 1, animated: true)
        if so21 >= thamso2 {self.stopTimer2()
        if thamso2 >= thamso1 && thamso2 >= thamso3 {
            self.hauxuly()
            spin_btn.isEnabled = true
            quay_jackpot.isEnabled = true     } }
    }
    func spin_run3() {
        so31 += 1
        pickView.selectRow(100 + so3 + so31, inComponent: 2, animated: true)
        if so31 >= thamso3 {self.stopTimer3()
        if thamso3 >= thamso2 && thamso3 >= thamso1 {
            self.hauxuly()
            spin_btn.isEnabled = true
            quay_jackpot.isEnabled = true     } }
    }
    func hauxuly()
    
    {
            dem = 0
            m = array_dulieu[0][((thamso1+so1)%10)]
            n = array_dulieu[0][((thamso2+so2)%10)]
            o = array_dulieu[0][((thamso3+so3)%10)]
            var array2: Array<Int> = [m,n,o]
            for j in 0..<array2.count { if x == array2[j]
            { dem += 1
                array2.remove(at: j)
                break
                }
                 }
            for j in 0..<array2.count { if y == array2[j]
            { dem += 1
                array2.remove(at: j)
                break
            }
               }
            
            
            if array2.count == 1 { if z == array2[0]
            { dem += 1 }
            else {dem += 0 }
                }
            
            else {
                for j in 0..<array2.count { if z == array2[j]
                { dem += 1
                    break }
                }
                
         }
    
            if dem == 3 {
                spin_txt.text = "Tuyệt vời! Bạn đã dành được Jackspot. Bạn được cộng 3000 điểm"
                if (loadInteger9 % 2) == 0 {
                    loadInteger3 += 2000 }
                else {
                    loadInteger4 += 2000 }
        }
            if dem == 2 { spin_txt.text = "Chúc mừng bạn đã  dành được giải nhất. Bạn được cộng 2000 điểm"
            if (loadInteger9 % 2) == 0 {
                    loadInteger3 += 1000 }
                else {
                    loadInteger4 += 1000 }
        }
            if dem == 1 {
                spin_txt.text = "Chúc mừng bạn đã dành được giải khuyến khích. Bạn được cộng 1000 điểm"
                if (loadInteger9 % 2) == 0 {
                    loadInteger3 += 500 }
                else {
                    loadInteger4 += 500 }
        }
            if dem == 0 { spin_txt.text = "Rất tiếc. Bạn chỉ được giải rút. Bạn không được cộng điểm nào" }
            
    }
    
    @IBAction func spinner_btn(_ sender: Any) {
        thamso1 = Int(arc4random_uniform(50) + 50)
        thamso2 = Int(arc4random_uniform(50) + 50)
        thamso3 = Int(arc4random_uniform(50) + 50)
        so11 = 0
        so21 = 0
        so31 = 0
        
        self.runTimer1()
        self.runTimer2()
        self.runTimer3()
        self.hauxuly()
        
        spin_btn.isEnabled = false
        quay_jackpot.isEnabled = false
        spin_txt.text = ""
    }

    
    @IBAction func back_btn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller: ViewController  = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        controller.mystring1 = loadString1
        controller.mystring2 = loadString2
        controller.aPoint = loadInteger3
        controller.bPoint = loadInteger4
        controller.bien_demA = loadInteger5
        controller.bien_demB = loadInteger6
        controller.thamsoA = loadInteger7
        controller.thamsoB = loadInteger8
        controller.bien_dem = loadInteger9 + 1
        self.present(controller, animated: true, completion: nil)
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
