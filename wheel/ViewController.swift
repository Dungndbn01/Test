//
//  ViewController.swift
//  wheel
//
//  Created by Nguyen Dinh Dung on 2017/09/29.
//  Copyright © 2017年 Nguyen Dinh Dung. All rights reserved.
//

import UIKit
import Toast_Swift

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imgQuat: UIImageView!
    @IBOutlet weak var Dem: UILabel!
    @IBOutlet weak var bat_tat: UISwitch!
    @IBOutlet weak var tocdo: UILabel!
    @IBOutlet weak var gia_toc: UILabel!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var soGoc: UILabel!
    @IBOutlet weak var diemLbl: UILabel!
    @IBOutlet weak var turnA: UILabel!
    @IBOutlet weak var turnB: UILabel!
    @IBOutlet weak var diemA: UILabel!
    @IBOutlet weak var diemB: UILabel!
    @IBOutlet weak var test_btn: UIButton!
    @IBOutlet weak var test2_btn: UIButton!
    
    
    var bien_dem: Int = Int(arc4random_uniform(2)) + 5
    var bien_demA: Int = 0
    var bien_demB: Int = 0
    var hesoA: Int = 1
    var hesoB: Int = 1
    var thamsoA: Int = 0
    var thamsoB: Int = 0
    var text_Field: UITextField!
    var array_diemA: [Int] = []
    var array_diemB: [Int] = []
    var thamso3: Int = 0
    var thamso4: Int = 0
    var thamso5: Int = 0
    var wait: Int = 2
    var aPoint: Int = 0
    var bPoint: Int = 0
    let Pi : Double = Double.pi
    var k,m : String?
    var q,n : String?
    var mystring1: String?
    var mystring2: String?
    var fw: String?
    var goc: Double = 0
    var timer: Timer!
    var a: Double = Double(arc4random()) / Double(UINT32_MAX) * abs(0.5 - 0.8) + min(0.5, 0.8)
    var randomDouble : Double = Double(arc4random()) / Double(UINT32_MAX) * abs(0.1 - 0.3) + min(0.1, 0.3)
    var giatoc = Double(arc4random()) / Double(UINT32_MAX) * abs(0.01 - 0.02) + min(0.01, 0.02)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ganLabel()
        self.showTurn()
        diemA.text = String(aPoint)
        diemB.text = String(bPoint)
        UserDefaults().set(mystring1, forKey: "A_Name")
        UserDefaults().set(mystring2, forKey: "B_Name")
        UserDefaults().set(bien_demA, forKey: "bien_demA")
        UserDefaults().set(bien_demB, forKey: "bien_demB")
        UserDefaults().set(thamsoA, forKey: "thamsoA")
        UserDefaults().set(thamsoB, forKey: "thamsoB")
        UserDefaults().set(bien_dem, forKey: "bien_dem")
        UserDefaults().set(aPoint, forKey: "aPoint")
        UserDefaults().set(bPoint,forKey: "bPoint")
        test_btn.layer.cornerRadius = 10
        test_btn.layer.borderWidth = 3
        test_btn.layer.borderColor = UIColor.brown.cgColor
        test2_btn.layer.cornerRadius = 10
        test2_btn.layer.borderWidth = 3
        test2_btn.layer.borderColor = UIColor.brown.cgColor
    }
    
    @IBAction func sw_congtac(_ sender: UISwitch) {
        
        if sender.isOn {
            self.runTimer()
            }
        else {
            randomDouble = Double(arc4random()) / Double(UINT32_MAX) * abs(0.1 - 0.3) + min(0.1, 0.3)
            a = Double(arc4random()) / Double(UINT32_MAX) * abs(0.5 - 0.8) + min(0.5, 0.8)
            
            giatoc = Double(arc4random()) / Double(UINT32_MAX) * abs(0.01 - 0.02) + min(0.01, 0.02)
            self.stopTimer()
            //self.Dem.text = String(format:"%.3f",randomDouble)
            // self.tocdo.text = String(format:"%.3f",a)
            // self.gia_toc.text = String(format:"%.3f",giatoc)
        }
    }
    
    func runTimer(){
    timer = Timer.scheduledTimer(timeInterval:randomDouble,
    target:self,
    selector:#selector(self.run),
    userInfo: nil,
    repeats:true)
    }
    
    func run() {
        self.test2_btn.isEnabled = false
        self.waiting()
        self.test_btn.isEnabled = false
        bat_tat.isEnabled = false
        //self.Dem.text = String(format:"%.3f",randomDouble)
        //self.tocdo.text = String(format:"%.3f",a)
        //self.gia_toc.text = String(format:"%.3f",giatoc)
        self.goc += a
        a = a - giatoc
        imgQuat?.transform = CGAffineTransform(rotationAngle: CGFloat(goc))
        
        //ket thuc timer
        
        if a<0 {
            self.test2_btn.isEnabled = true
            self.test_btn.isEnabled = true
            bien_dem = bien_dem + 1
            thamso4 = bien_dem
            self.laygoc()
            if (thamso3 == thamso4 - 1 || thamso5 == thamso4 - 1) {showTurn2() }
            else {self.showTurn()}
            self.bat_tat.setOn(false, animated:true)
            bat_tat.isEnabled = true
            self.stopTimer()
            randomDouble = Double(arc4random()) / Double(UINT32_MAX) * abs(0.1 - 0.3) + min(0.1, 0.3)
            a = Double(arc4random()) / Double(UINT32_MAX) * abs(0.5 - 0.8) + min(0.5, 0.8)
            giatoc = Double(arc4random()) / Double(UINT32_MAX) * abs(0.01 - 0.02) + min(0.01, 0.02)
            
        }    }
    
    func showTurn()
    {
        if (bien_dem % 2) == 0 {
            self.turnA.text = "Lượt gamer " + (k ?? "")
            self.turnB.text = ""
            self.xulyB()
            if self.bien_demA >= 3 { self.test_btn.isEnabled = false }
            if self.thamsoA >= 1 {self.test2_btn.isEnabled = false }
            else { self.test2_btn.isEnabled = true }
        }
        else {
            self.turnB .text = "Lượt gamer " + (m ?? "")
            self.turnA.text = ""
            self.xulyA()
            if self.bien_demB >= 3 { self.test_btn.isEnabled = false }
            if self.thamsoB >= 1 {self.test2_btn.isEnabled = false }
            else { self.test2_btn.isEnabled = true }
        }
    }
    
    func showTurn2()
    {
        if (bien_dem % 2) == 0 { self.turnA .text = "Lượt gamer " + (k ?? "")
            self.turnB.text = ""
            self.xulyA()
            if self.bien_demA >= 3 { self.test_btn.isEnabled = false }
            if self.thamsoA >= 1 {self.test2_btn.isEnabled = false }
            else { self.test2_btn.isEnabled = true }
        }
        else { self.turnB .text = "Lượt gamer " + (m ?? "")
            self.turnA.text = ""
            self.xulyB()
            if self.bien_demB >= 3 { self.test_btn.isEnabled = false }
            if self.thamsoB >= 1 { self.test2_btn.isEnabled = false }
            else { self.test2_btn.isEnabled = true }
        }
    }
    
    func xulyA()
    {   thamso3 = 0
        switch self.diemLbl.text! {
        case "800":
            aPoint += 800*hesoA ; array_diemA.append(aPoint)
        case "1000":
            aPoint += 1000*hesoA ;array_diemA.append(aPoint)
        case "400":
            aPoint += 400*hesoA ; array_diemA.append(aPoint)
        case "600":
            aPoint += 600*hesoA ;array_diemA.append(aPoint)
        case "300":
            aPoint += 300*hesoA ; array_diemA.append(aPoint)
        case "100":
            aPoint += 100*hesoA ;array_diemA.append(aPoint)
        case "500":
            aPoint += 500*hesoA ;array_diemA.append(aPoint)
        case "200":
            aPoint += 200*hesoA ;array_diemA.append(aPoint)
        case "700":
            aPoint += 700*hesoA ;array_diemA.append(aPoint)
        case "900":
            aPoint += 900*hesoA ;array_diemA.append(aPoint)
        case "2000":
            aPoint += 2000*hesoA ;array_diemA.append(aPoint)
        case "Nhân Đôi":
            aPoint = Int(aPoint*2) ;array_diemA.append(aPoint)
        case "Chia Đôi":
            aPoint = Int(aPoint/2) ;array_diemA.append(aPoint)
        case "Mất Lượt":
            bien_dem -= 1
        default:
            aPoint += 0
        }
        
        
        if self.diemLbl.text == "May Mắn"
        { bien_dem -= 1
          lucky_turn()
          array_diemA.append(aPoint)
        }
            // perhaps use action.title here
        
        if self.diemLbl.text == "Mất Điểm" {
            if array_diemA.count > 1
            {array_diemA.remove(at: array_diemA.count - 1)
                aPoint = array_diemA[array_diemA.count - 1] }
            else { aPoint = 0 }
             }
        diemA.text = String(aPoint)
        UserDefaults().set(aPoint, forKey: "aPoint")
        thamso3 = bien_dem
        UserDefaults().set(bien_dem, forKey: "bien_dem")
        hesoA = 1
        
    }
    
    func xulyB()
    {   thamso3 = 0
        switch self.diemLbl.text! {
        case "800":
            bPoint += 800*hesoB ; array_diemB.append(bPoint)
        case "1000":
            bPoint += 1000*hesoB ; array_diemB.append(bPoint)
        case "400":
            bPoint += 400*hesoB ; array_diemB.append(bPoint)
        case "600":
            bPoint += 600*hesoB ; array_diemB.append(bPoint)
        case "500":
            bPoint += 500*hesoB ; array_diemB.append(bPoint)
        case "300":
            bPoint += 300*hesoB ; array_diemB.append(bPoint)
        case "100":
            bPoint += 100*hesoB ; array_diemB.append(bPoint)
        case "200":
            bPoint += 200*hesoB ; array_diemB.append(bPoint)
        case "700":
            bPoint += 700*hesoB ; array_diemB.append(bPoint)
        case "900":
            bPoint += 900*hesoB ; array_diemB.append(bPoint)
        case "2000":
            bPoint += 2000*hesoB ; array_diemB.append(bPoint)
        case "Nhân Đôi":
            bPoint = Int(bPoint*2) ; array_diemB.append(bPoint)
        case "Chia Đôi":
            bPoint = Int(bPoint/2) ; array_diemB.append(bPoint)
        case "Mất Lượt":
            bien_dem -= 1
        default:
            bPoint += 0
        }
        if self.diemLbl.text == "May Mắn"
        {   bien_dem -= 1
            lucky_turn()
            array_diemB.append(bPoint)
        }
        
        if self.diemLbl.text == "Mất Điểm" {
            if array_diemB.count > 1
            {array_diemB.remove(at: array_diemB.count - 1)
             bPoint = array_diemB[array_diemB.count-2] }
            else { bPoint = 0 }
        }
        diemB.text = String(bPoint)
        UserDefaults().set(bPoint, forKey: "bPoint")
        thamso3 = bien_dem
        UserDefaults().set(bien_dem, forKey: "bien_dem")
        hesoB = 1
        
    }
    
    func waiting() {
        wait = wait + 1
        var thamso: Int = 0
        var thamso2: Int = wait
        while thamso2 >= 3 {
            thamso2 -= 3
            thamso += 1 }
        if (thamso%3) == 1 { diemLbl.text = "Waiting." }
        if (thamso%3) == 2 { diemLbl.text = "Waiting.."}
        if (thamso%3) == 0 { diemLbl.text = "Waiting..."}
        }
    
    func stopTimer() {
       timer.invalidate()
       timer = nil
    }
    
    func laygoc()
    {   thamso3 = 0
        while goc >= 2*Pi {
        goc -= 2*Pi }
        // soGoc.text = String(format:"%.3f", goc)
        
        if (goc<(Pi/24) || goc>=(2*Pi-Pi/24)) { diemLbl.text = "800"}
        if ((Pi/24)<goc && goc<=(3*Pi/24)) {diemLbl.text = "Mất Điểm" }
        if ((3*Pi/24)<goc && goc<=(5*Pi/24)) {diemLbl.text = "1000" }
        if ((5*Pi/24)<goc && goc<=(7*Pi/24)) {diemLbl.text = "400" }
        if ((7*Pi/24)<goc && goc<=(9*Pi/24)) {diemLbl.text = "600" }
    if ((9*Pi/24)<goc && goc<=(11*Pi/24)) {diemLbl.text = "300" }
    if ((11*Pi/24)<goc && goc<=(13*Pi/24)) {diemLbl.text = "Thêm Lượt"
                                            bien_dem -= 1
                                     thamso3 = bien_dem}
        if ((13*Pi/24)<goc && goc<=(15*Pi/24)) {diemLbl.text = "200" }
        if ((15*Pi/24)<goc && goc<=(17*Pi/24)) {diemLbl.text = "900" }
        if ((17*Pi/24)<goc && goc<=(19*Pi/24)) {diemLbl.text = "700" }
    if ((19*Pi/24)<goc && goc<=(21*Pi/24)) {diemLbl.text = "Chia Đôi" }
    if ((21*Pi/24)<goc && goc<=(23*Pi/24)) {diemLbl.text = "300" }
    if ((23*Pi/24)<goc && goc<=(25*Pi/24)) {diemLbl.text = "2000" }
    if ((25*Pi/24)<goc && goc<=(27*Pi/24)) {diemLbl.text = "100" }
    if ((27*Pi/24)<goc && goc<=(29*Pi/24)) {diemLbl.text = "500" }
    if ((29*Pi/24)<goc && goc<=(31*Pi/24)) {diemLbl.text = "Nhân Đôi" }
    if ((31*Pi/24)<goc && goc<=(33*Pi/24)) {diemLbl.text = "200" }
    if ((33*Pi/24)<goc && goc<=(35*Pi/24)) {diemLbl.text = "700" }
    if ((35*Pi/24)<goc && goc<=(37*Pi/24)) {diemLbl.text = "1000" }
    if ((37*Pi/24)<goc && goc<=(39*Pi/24)) {diemLbl.text = "400" }
    if ((39*Pi/24)<goc && goc<=(41*Pi/24)) {diemLbl.text = "Mất Lượt"
                                        thamso5 = bien_dem - 1}
    if ((41*Pi/24)<goc && goc<=(43*Pi/24)) {diemLbl.text = "900" }
    if ((43*Pi/24)<goc && goc<=(45*Pi/24)) {diemLbl.text = "May Mắn" }
    if ((45*Pi/24)<goc && goc<=(47*Pi/24)) {diemLbl.text = "300" }
    }
    func ganLabel()
    {self.name1.text = mystring1?.components(separatedBy: " ").last
        self.name2.text = mystring2?.components(separatedBy: " ").last
        k = self.name1.text
        q = "Game thủ " + (k ?? "")
        m = self.name2.text
        n = "Game thủ " + (m ?? "")
        
        name1.text = q
        name2.text = n
    }
    
    
    func callAction()
    {   //if self.test.alert.textField == "1"
        //if textthamchieu == ""
        if self.text_Field.text! == "1"
        {
            self.performSegue(withIdentifier: "segue2", sender: self) }
        if self.text_Field.text! == "2"
        {
            self.performSegue(withIdentifier: "segue3", sender: self) }
        if self.text_Field.text! == "3"
        {
            self.performSegue(withIdentifier: "segue4", sender: self) }
        
        //  name1.text = self.text_thamchieu
    }
    
    @IBAction func test2(_ sender: Any) {
        self.view.makeToast("Bạn vừa chọn Ngôi sao may mắn. Số điểm của bạn sẽ được nhân đôi ở câu hỏi này. Lưu ý: Bạn chỉ được chọn 1 lần", duration: 2.5, position: .center)
        self.test2_btn.isEnabled = false
        if (bien_dem % 2) == 0  {hesoA += 1
            thamsoA += 1
            UserDefaults().set(thamsoA, forKey: "thamsoA")
                }
        if (bien_dem % 2) == 1  {hesoB += 1
            thamsoB += 1
            UserDefaults().set(thamsoB, forKey: "thamsoB")
            }
                }
    
    func lucky_turn() {
        let alert = UIAlertController(title: "THÔNG BÁO", message: "Bạn nhận được món quà từ chương trình. Hãy nhập \n      1:Game trí nhớ \n  2:Game Jackpot \n  3:Game Pikachu \n để nhận quà. ", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: {(textField) in
            
            textField.placeholder = "Chọn số" } )
        let textField1 = alert.textFields![0] as UITextField
        
        self.text_Field = textField1
        
        //textthamchieu = textField.text
        
        let noAction = UIAlertAction(title: "NO",style: .destructive, handler: nil
        )
        
        alert.addAction(noAction)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.callAction()
            // self.name1.text = self.textthamchieu
            
        }  ))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func test(_ sender: Any) {
        self.view.makeToast("Bạn vừa chọn chiếc hộp kì diệu. Lưu ý: Bạn chỉ được chọn tối đa 3 lần", duration: 2.5, position: .top)
        if (bien_dem % 2) == 0 { bien_demA += 1
            UserDefaults().set(bien_demA, forKey: "bien_demA")
            //  self.test_btn.isEnabled = false
        }
        if (bien_dem % 2) == 1 { bien_demB += 1
            UserDefaults().set(bien_demB, forKey: "bien_demB")
            //  self.test_btn.isEnabled = false
        }
        lucky_turn()

        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

