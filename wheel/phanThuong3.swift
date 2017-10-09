//
//  phanThuong3.swift
//  wheel
//
//  Created by Nguyen Dinh Dung on 2017/10/01.
//  Copyright © 2017年 Nguyen Dinh Dung. All rights reserved.
//

import UIKit

class phanThuong3: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var coll_View: UICollectionView!
    @IBOutlet weak var diem_Lbl: UILabel!
    @IBOutlet weak var time_Lbl: UILabel!
    @IBOutlet weak var start_btn: UIButton!
    @IBOutlet weak var reset_btn: UIButton!
    
    
    var array: [String] = []
    var array1: Array<String> = []
    var i: Int = Int(arc4random_uniform(44)) + 1
    var j: Int = 0
    var j_plus: Int = 0
    var k: Int = 0
    var k_plus: Int = 0
    var x1: Int = 0
    var y1: Int = 0
    var x2: Int = 0
    var y2: Int = 0
    var thamso1: [Int] = []
    var thamso2: [Int] = []
    var diem: Int = 0
    var string: String = ""
    var thamso: [Int] = []
    var timer: Timer!
    var q: Int = 0
    var p: Int = 0
    var bien_alpha: [CGFloat] = []
    var thamchieu: Int = 0
    var thamchieu1: Int = 0
    var thamchieu2: Int = 0
    var bool1: Bool = false
    var bool2: Bool = false
    var bool3: Bool = false
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
        self.coll_View.delegate = self
        self.coll_View.dataSource = self
        self.coll_View.isUserInteractionEnabled = false
        loadString1 = UserDefaults().string(forKey: "A_Name") ?? ""
        loadString2 = UserDefaults().string(forKey: "B_Name") ?? ""
        loadInteger3 = UserDefaults().integer(forKey: "aPoint")
        loadInteger4 = UserDefaults().integer(forKey: "bPoint")
        loadInteger9 = UserDefaults().integer(forKey: "bien_dem")
        loadInteger5 = UserDefaults().integer(forKey: "bien_demA")
        loadInteger6 = UserDefaults().integer(forKey: "bien_demB")
        loadInteger7 = UserDefaults().integer(forKey: "thamsoA")
        loadInteger8 = UserDefaults().integer(forKey: "thamsoB")
        for _ in 1...50 {
            bien_alpha.append(1)
        }
        random_array()
        reset_btn.isEnabled = false
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: myCustomerCell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "myCustomerCell2", for: indexPath as IndexPath) as! myCustomerCell2
        cell.img_hinh.image = UIImage(named: array[indexPath.row])
        cell.img_hinh.alpha = bien_alpha[indexPath.row]
        if array[indexPath.row] == "" {
            cell.isUserInteractionEnabled = false
        }
        else {
            cell.isUserInteractionEnabled = true
        }
        return cell
    }
    
    func random_array() {
        array1 = []
        for q in 1...50 {
            array.append(String(q)+".jpg") }
        
        for j in 0...48 {
            k = 50 - j
            i = Int(arc4random_uniform(UInt32(k)))
            string = array[i]
            array1.append(string)
            array.remove(at:i)
        }
        string = array[0]
        array1.append(string)
        array = array1
        
    }
    
    @IBAction func random_image(_ sender: Any) {
        for j in 0...49 {
            bien_alpha[j] = 1
        }
        array1 = []
        
        for j in 0...48 {
            k = 50 - j
            i = Int(arc4random_uniform(UInt32(k)))
            string = array[i]
            array1.append(string)
            array.remove(at:i)
        }
        string = array[0]
        array1.append(string)
        
        array = array1
        
        self.coll_View.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        bien_alpha[indexPath.row] = 0.5
        for j in 0...49 {
            if j != indexPath.row {
                bien_alpha[j] = 1
            }
        }
        
        for j in 1...50 {
            if String(j) + ".jpg" == array[indexPath.row] {
                thamchieu = j
                thamso.append(thamchieu)
            } }
        if thamso.count > 1 {
            thamso1 = []
            thamso2 = []
            if thamso[thamso.count - 1] + thamso[thamso.count - 2] == 51 {
                for i in 0...49 {
                    if String(thamso[thamso.count - 1]) + ".jpg" == array[i] {
                        thamchieu1 = i
                        thamso1.append(Int(i/5))
                        thamso2.append(i%5)
                    }
                    if String(thamso[thamso.count - 2]) + ".jpg" == array[i] {
                        thamchieu2 = i
                        thamso1.append(Int(i/5))
                        thamso2.append(i%5)
                    }
                }
                x1 = thamso2[0]
                x2 = thamso2[1]
                y1 = thamso1[0]
                y2 = thamso1[1]
                if (y1 == y2 && y2 == 0) || (y1 == y2 && y2 == 9) || (x1 == x2 && x2 == 0) || (x1 == x2 && x2 == 4) {
                    diem = diem + 1
                    array[thamchieu1] = ""
                    array[thamchieu2] = ""
                }
                else {
                    i = 0
                    array[thamchieu1] = ""
                    array[thamchieu2] = ""
                    if thamso1[0] <= thamso1[1] {
                        y1 = thamso1[0]
                        x1 = thamso2[0]
                        y2 = thamso1[1]
                        x2 = thamso2[1]
                    }
                    else {
                        y1 = thamso1[1]
                        x1 = thamso2[1]
                        y2 = thamso1[0]
                        x2 = thamso2[0]
                    }
                    for k in 0...y1 {
                        if k == 0 {
                            for k_plus in 0...y1 {
                                if array[k_plus*5+x1] != "" {
                                    bool1 = false
                                    break
                                } else {
                                    bool1 = true
                                }
                            }
                            for k_plus in 0...y2 {
                                if array[k_plus*5+x2] != "" {
                                    bool2 = false
                                    break
                                } else {
                                    bool2 = true
                                }
                            }
                            if bool1 && bool2 == true {
                                i += 1
                            }
                            
                        } else {
                            for k_plus in k...y1 {
                                if array[k_plus*5+x1] != "" {
                                    bool1 = false
                                    break
                                } else {
                                    bool1 = true
                                }
                            }
                            
                            for k_plus in k...y2 {
                                if array[k_plus*5+x2] != "" {
                                    bool2 = false
                                    break
                                } else {
                                    bool2 = true
                                }
                            }
                            if x1 <= x2 {
                                for k_plus in x1...x2 {
                                    if array[5*k+k_plus] != "" {
                                        bool3 = false
                                        break
                                    } else {
                                        bool3 = true
                                    }
                                }
                            } else {
                                for k_plus in x2...x1 {
                                    if array[5*k+k_plus] != "" {
                                        bool3 = false
                                        break
                                    } else {
                                        bool3 = true
                                    }
                                }
                            }
                            if bool1 && bool2 && bool3 == true {
                                i += 1
                            }
                            
                        }
                        if i != 0 {
                            break
                        }
                    }
                    if i == 0 {
                        for k in y2...9 {
                            if k == 9 {
                                for k_plus in y2...9 {
                                    if array[k_plus*5+x2] != "" {
                                        bool1 = false
                                        break
                                    } else {
                                        bool1 = true
                                    }
                                }
                                for k_plus in y1...9 {
                                    if array[k_plus*5+x1] != "" {
                                        bool2 = false
                                        break
                                    } else {
                                        bool2 = true
                                    }
                                }
                                if bool1 && bool2 == true {
                                    i += 1
                                }
                                
                            } else {
                                for k_plus in y1...k {
                                    if array[k_plus*5+x1] != "" {
                                        bool1 = false
                                        break
                                    } else {
                                        bool1 = true
                                    }
                                }
                                
                                for k_plus in y2...k {
                                    if array[k_plus*5+x2] != "" {
                                        bool2 = false
                                        break
                                    } else {
                                        bool2 = true
                                    }
                                }
                                if x1 <= x2 {
                                    for k_plus in x1...x2 {
                                        if array[5*k+k_plus] != "" {
                                            bool3 = false
                                            break
                                        } else {
                                            bool3 = true
                                        }
                                    }
                                } else {
                                    for k_plus in x2...x1 {
                                        if array[5*k+k_plus] != "" {
                                            bool3 = false
                                            break
                                        } else {
                                            bool3 = true
                                        }
                                    }
                                }
                                if bool1 && bool2 && bool3 == true {
                                    i += 1
                                }
                                
                            }
                            if i != 0 {
                                break
                            }
                        }
                    }
                    if i == 0 {
                        for k in y1...y2 {
                            for k_plus in y1...k {
                                if array[k_plus*5+x1] != "" {
                                    bool1 = false
                                    break
                                } else {
                                    bool1 = true
                                }
                            }
                            for k_plus in k...y2 {
                                if array[k_plus*5 + x2] != "" {
                                    bool2 = false
                                    break
                                } else {
                                    bool2 = true
                                }
                            }
                            if x1 <= x2 {
                                for k_plus in x1...x2 {
                                    if array[5*k+k_plus] != "" {
                                        bool3 = false
                                        break
                                    } else {
                                        bool3 = true
                                    }
                                }
                            } else {
                                for k_plus in x2...x1 {
                                    if array[5*k+k_plus] != "" {
                                        bool3 = false
                                        break
                                    } else {
                                        bool3 = true
                                    }
                                }
                            }
                            if bool1 && bool2 && bool3 && true {
                                i += 1
                                break } } }
                    // DOAN CAT O DAY
                    // HAY NHO LA NO O DAY
                    if thamso2[0] <= thamso2[1] {
                        y1 = thamso1[0]
                        x1 = thamso2[0]
                        y2 = thamso1[1]
                        x2 = thamso2[1]
                    }
                    else {
                        y1 = thamso1[1]
                        x1 = thamso2[1]
                        y2 = thamso1[0]
                        x2 = thamso2[0]
                    }
                    if i == 0 {
                        for k in 0...x1 {
                            if k == 0 {
                                for k_plus in 0...x1 {
                                    if array[y1*5+k_plus] != "" {
                                        bool1 = false
                                        break
                                    } else {
                                        bool1 = true
                                    }
                                }
                                for k_plus in 0...x2 {
                                    if array[y2*5+k_plus] != "" {
                                        bool2 = false
                                        break
                                    } else {
                                        bool2 = true
                                    }
                                }
                                if bool1 && bool2 == true {
                                    i += 1
                                }
                                
                            } else {
                                for k_plus in k...x1 {
                                    if array[y1*5+k_plus] != "" {
                                        bool1 = false
                                        break
                                    } else {
                                        bool1 = true
                                    }
                                }
                                
                                for k_plus in k...x2 {
                                    if array[y2*5+k_plus] != "" {
                                        bool2 = false
                                        break
                                    } else {
                                        bool2 = true
                                    }
                                }
                                if y1 <= y2 {
                                    for k_plus in y1...y2 {
                                        if array[5*k_plus+k] != "" {
                                            bool3 = false
                                            break
                                        } else {
                                            bool3 = true
                                        }
                                    }
                                } else {
                                    for k_plus in y2...y1 {
                                        if array[5*k_plus+k] != "" {
                                            bool3 = false
                                            break
                                        } else {
                                            bool3 = true
                                        }
                                    }
                                }
                                if bool1 && bool2 && bool3 == true {
                                    i += 1
                                }
                                
                            }
                            if i != 0 {
                                break
                            }
                        } }
                    /// DANG DUNG O DAY
                    if i == 0 {
                        for k in x2...4 {
                            if k == 4 {
                                for k_plus in x2...4 {
                                    if array[y2*5+k_plus] != "" {
                                        bool1 = false
                                        break
                                    } else {
                                        bool1 = true
                                    }
                                }
                                for k_plus in x1...4 {
                                    if array[y1*5+k_plus] != "" {
                                        bool2 = false
                                        break
                                    } else {
                                        bool2 = true
                                    }
                                }
                                if bool1 && bool2 == true {
                                    i += 1
                                }
                                
                            } else {
                                for k_plus in x1...k {
                                    if array[y1*5+k_plus] != "" {
                                        bool1 = false
                                        break
                                    } else {
                                        bool1 = true
                                    }
                                }
                                
                                for k_plus in x2...k {
                                    if array[y2*5+k_plus] != "" {
                                        bool2 = false
                                        break
                                    } else {
                                        bool2 = true
                                    }
                                }
                                if y1 <= y2 {
                                    for k_plus in y1...y2 {
                                        if array[5*k_plus+k] != "" {
                                            bool3 = false
                                            break
                                        } else {
                                            bool3 = true
                                        }
                                    }
                                } else {
                                    for k_plus in y2...y1 {
                                        if array[5*k_plus+k] != "" {
                                            bool3 = false
                                            break
                                        } else {
                                            bool3 = true
                                        }
                                    }
                                }
                                if bool1 && bool2 && bool3 == true {
                                    i += 1
                                }
                                
                            }
                            if i != 0 {
                                break
                            }
                        }
                    }
                    if i == 0 {
                        for k in x1...x2 {
                            for k_plus in x1...k {
                                if array[y1*5+k_plus] != "" {
                                    bool1 = false
                                    break
                                } else {
                                    bool1 = true
                                }
                            }
                            for k_plus in k...x2 {
                                if array[y2*5 + k_plus] != "" {
                                    bool2 = false
                                    break
                                } else {
                                    bool2 = true
                                }
                            }
                            if y1 <= y2 {
                                for k_plus in y1...y2 {
                                    if array[5*k_plus+k] != "" {
                                        bool3 = false
                                        break
                                    } else {
                                        bool3 = true
                                    }
                                }
                            } else {
                                for k_plus in y2...y1 {
                                    if array[5*k_plus+k] != "" {
                                        bool3 = false
                                        break
                                    } else {
                                        bool3 = true
                                    }
                                }
                            }
                            if bool1 && bool2 && bool3 && true {
                                i += 1
                                break } } }
                    if i == 0 {
                        array[thamchieu1] = String(thamso[thamso.count - 1]) + ".jpg"
                        array[thamchieu2] = String(thamso[thamso.count - 2]) + ".jpg"
                    } else {
                        array[thamchieu1] = ""
                        array[thamchieu2] = ""
                        diem = diem + 1
                    }
                }
                
            } else { diem += 0 }
        }
        
        
        self.coll_View.reloadData()
        
    }
    
    
    @IBAction func reset(_ sender: Any) {
        reset_btn.isEnabled = false
        diem_Lbl.text = "0"
        time_Lbl.text = "0"
        start_btn.isEnabled = true
        thamso = []
        bien_alpha = []
        for i in 1...50 {
            array[i-1] = String(i) + ".jpg"
        }
        self.random_array()
        
        for _ in 1...50 {
            bien_alpha.append(1)
        }
        self.coll_View.reloadData()
    }
    
    
    @IBAction func start(_ sender: Any) {
        reset_btn.isEnabled = false
        p = 0
        q = 0
        diem = 0
        self.runtimer()
        start_btn.isEnabled = false
        self.coll_View.isUserInteractionEnabled = true
    }
    
    func runtimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(self.run),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func run() {
        reset_btn.isEnabled = false
        diem_Lbl.text = String(diem)
        if diem == 25 {
            let alert = UIAlertController(title: "CHÚC MỪNG", message: "Bạn đã hoàn thành trò chơi. Bạn được cộng 1000 điểm", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert,animated: true, completion: nil)
            timer.invalidate()
            timer = nil
            reset_btn.isEnabled = true
            if (loadInteger9 % 2) == 0 {
                loadInteger3 += 1000 }
            else {
                loadInteger4 += 1000 }
        }
        p += 1
        if p == 100 {
            q += 1
            p = 0
            //      diem_Lbl.text = String(diem)
        }
        time_Lbl.text = String(q)
        if q == 65 {
            reset_btn.isEnabled = true
            self.timer.invalidate()
            self.timer = nil
            self.coll_View.isUserInteractionEnabled = false
            reset_btn.isEnabled = true
            //    diem_Lbl.text = String(diem)
            let alert = UIAlertController(title: "GAME OVER", message: "Chúc bạn may mắn lần sau. Ahihi, đồ ngốc", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
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


