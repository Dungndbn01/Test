//
//  phanThuong2.swift
//  wheel
//
//  Created by Nguyen Dinh Dung on 2017/10/01.
//  Copyright © 2017年 Nguyen Dinh Dung. All rights reserved.
//

import UIKit

class phanThuong2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var coll_view: UICollectionView!
    @IBOutlet weak var time_Lbl: UILabel!
    @IBOutlet weak var point_Lbl: UILabel!
    @IBOutlet weak var start_btn: UIButton!
    
    var array: [String] = []
    var array1: [String] = []
    var array2: [String] = []
    var thamso1: [Int] = []
    var thamso2: [Int] = []
    var i: Int = 0
    var j: Int = 0
    var k: Int = 0
    var m: Int = 0
    var n: Int = 0
    var m1: Int = 0
    var n1: Int = 0
    var m2: Int = 0
    var n2: Int = 0
    var p: Int = 0
    var diem: Int = 0
    var thamsoi: Int = 0
    var thamsoj: Int = 0
    var thamchieu1: Int = 0
    var thamchieu2: Int = 0
    var thamchieuchinh: Int = 0
    var string: String = ""
    var timer1: Timer!
    var timer2: Timer!
    var timer3: Timer!
    var loadString1: String = ""
    var loadString2: String = ""
    var loadInteger3: Int = 0
    var loadInteger4: Int = 0
    var loadInteger5: Int = 0
    var loadInteger6: Int = 0
    var loadInteger7: Int = 0
    var loadInteger8: Int = 0
    var loadInteger9: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coll_view.delegate = self
        coll_view.dataSource = self
        coll_view.isUserInteractionEnabled = false
        loadString1 = UserDefaults().string(forKey: "A_Name") ?? ""
        loadString2 = UserDefaults().string(forKey: "B_Name") ?? ""
        loadInteger3 = UserDefaults().integer(forKey: "aPoint")
        loadInteger4 = UserDefaults().integer(forKey: "bPoint")
        loadInteger9 = UserDefaults().integer(forKey: "bien_dem")
        loadInteger5 = UserDefaults().integer(forKey: "bien_demA")
        loadInteger6 = UserDefaults().integer(forKey: "bien_demB")
        loadInteger7 = UserDefaults().integer(forKey: "thamsoA")
        loadInteger8 = UserDefaults().integer(forKey: "thamsoB")
        for _ in 51...78 {
            array.append("back.jpg")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func random_array() {
        array2 = []
        for i in 51...78 {
            array2.append(String(i) + ".jpg")
        }
        array1 = []
        for j in 0...26 {
            k = 28 - j
            i = Int(arc4random_uniform(UInt32(k)))
            string = array2[i]
            array1.append(string)
            array2.remove(at:i)
        }
        string = array2[0]
        array1.append(string)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: myCustomerCell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "myCustomerCell1", for: indexPath as IndexPath) as! myCustomerCell1
        cell.img_hinh.image = UIImage(named: array[indexPath.row])
        if array[indexPath.row] != "back.jpg" {
            cell.isUserInteractionEnabled = false
        }
        else {
            cell.isUserInteractionEnabled = true
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if array[indexPath.row] != "back.jpg" {
            return nil
        } else {
            return indexPath
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if i == 0 {
            thamchieuchinh = 0
            thamsoi = indexPath.row
            array[indexPath.row] = array1[indexPath.row]
            self.coll_view.reloadData()
            for m1 in 51...78 {
                if String(m1) + ".jpg" == array[indexPath.row] {
                    thamchieu1 = m1
                    thamso1.append(thamchieu1)
                } }
            runTimer1() }
        
        if i != 0 && j == 0 {
            thamsoj = indexPath.row
            array[indexPath.row] = array1[indexPath.row]
            self.coll_view.reloadData()
            for m2 in 51...78 {
                if String(m2) + ".jpg" == array[indexPath.row] {
                    thamchieu2 = m2
                    thamso1.append(thamchieu2)
                }
            }
            if thamso1.count > 1{
                m2 = thamso1.count
                if thamso1[m2-1] + thamso1[m2-2] == 129 {
                    i = 0
                    thamchieuchinh += 1
                    diem += 1
                    for n2 in 0...27 {
                        if String(thamso1[m2-1]) + ".jpg" == array[n2] {
                            array[n2] = array1[n2]
                            
                        }
                        if String(thamso1[m2-2]) + ".jpg" == array[n2] {
                            array[n2] = array1[n2]
                            
                        }
                    }
                    self.coll_view.reloadData()
                } else { runTimer2() }
            }
            else {
                runTimer2() }
        }
        
        if i != 0 && j != 0 {
            array[indexPath.row] = "back.jpg"
            self.coll_view.reloadData()
        }
        
    }
    
    func runTimer1() {
        timer1 = Timer.scheduledTimer(timeInterval: 0.001,
                                      target: self,
                                      selector: #selector(self.run1),
                                      userInfo: nil,
                                      repeats: true)
    }
    
    func run1() {
        i += 1
        if i == 1000 {
            self.stop1()
        }
    }
    
    func stop1() {
        if thamchieuchinh == 0 {
            array[thamsoi] = "back.jpg" }
        timer1.invalidate()
        timer1 = nil
        self.coll_view.reloadData()
        i = 0
    }
    
    func runTimer2() {
        timer2 = Timer.scheduledTimer(timeInterval: 0.001,
                                      target: self,
                                      selector: #selector(self.run2),
                                      userInfo: nil,
                                      repeats: true)
    }
    
    func run2() {
        j += 1
        if j == 1000 {
            self.stop2()
        }
    }
    
    func stop2() {
        array[thamsoj] = "back.jpg"
        timer2.invalidate()
        timer2 = nil
        self.coll_view.reloadData()
        j = 0
    }
    
    func runtimer3() {
        timer3 = Timer.scheduledTimer(timeInterval: 1,
                                      target: self,
                                      selector: #selector(self.run3),
                                      userInfo: nil,
                                      repeats: true)
    }
    
    func run3() {
        time_Lbl.text = String(p)
        point_Lbl.text = String(diem)
        if diem == 14 { stop4() }
        p += 1
        if p == 81 { stop3()
        }
    }
    
    func stop3() {
        timer3.invalidate()
        timer3 = nil
        start_btn.isEnabled = true
        self.coll_view.isUserInteractionEnabled = false
        let alert = UIAlertController(title: "GAME OVER",
                                      message: "Chúc bạn may mắn lần sau. Ahihi, đồ ngốc.",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func stop4() {
        timer3.invalidate()
        timer3 = nil
        start_btn.isEnabled = true
        self.coll_view.isUserInteractionEnabled = false
        let alert = UIAlertController(title: "CHÚC MỪNG",
                                      message: "Bạn đã hoàn thành trò chơi. Bạn được cộng 1000 điểm",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .cancel,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        if (loadInteger9 % 2) == 0 {
            loadInteger3 += 1000 }
        else {
            loadInteger4 += 1000 }
    }
    @IBAction func start(_ sender: Any) {
        runtimer3()
        random_array()
        start_btn.isEnabled = false
        coll_view.isUserInteractionEnabled = true
        i = 0
        j = 0
        p = 0
        diem = 0
        thamso1 = []
        thamchieu1 = 0
        thamso2 = []
        thamchieu2 = 0
        array = []
        for _ in 51...78 {
            array.append("back.jpg")
        }
        self.coll_view.reloadData()
    }
    
    @IBAction func back(_ sender: Any) {
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 */
