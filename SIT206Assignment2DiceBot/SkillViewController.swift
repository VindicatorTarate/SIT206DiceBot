//
//  SkillViewController.swift
//  SIT206Assignment2DiceBot
//
//  Created by Tarate Tian on 27/5/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController {

    var quantity = 1
    var limit = 0
    var resultArray = [Int]()
    var result = 0
    var resultText = ""
    var sum = 0
    var bonus = 0
    var skillText = ""
    var alertTitle = "RESULT"
    
    @IBOutlet weak var bonus1: UITextField!
    @IBOutlet weak var bonus2: UITextField!
    @IBOutlet weak var bonus3: UITextField!
    @IBOutlet weak var bonus4: UITextField!
    @IBOutlet weak var bonus5: UITextField!
    @IBOutlet weak var bonus6: UITextField!
    @IBOutlet weak var bonus7: UITextField!
    @IBOutlet weak var bonus8: UITextField!
    
    @IBAction func skillCheck(_ sender: UIButton)
    {
        sum = 0
        result = 0
        resultText = ""
        skillText = ""
        quantity = 1
        limit = 20
        bonus = 0
        
        
        switch (sender.tag)
        {
        case 201:
            skillText = "Acrobatics"
            bonus = Int(bonus1.text!)!
        case 202:
            skillText = "Insight"
            bonus = Int(bonus2.text!)!
        case 203:
            skillText = "Arcana"
            bonus = Int(bonus3.text!)!
        case 204:
            skillText = "Deception"
            bonus = Int(bonus4.text!)!
        case 205:
            skillText = "Medicine"
            bonus = Int(bonus5.text!)!
        case 206:
            skillText = "Strength"
            bonus = Int(bonus6.text!)!
        case 207:
            skillText = "Stealth"
            bonus = Int(bonus7.text!)!
        case 208:
            skillText = "Survival"
            bonus = Int(bonus8.text!)!
        default:
            skillText = "Unknown skill"
        }
        
        result = generateRandomNum (limit, quantity)[0] + bonus
        resultText = skillText + " check result: " + String(result)
        
        //alert: resultText
        alert(title: alertTitle, message: resultText)
        
    }
    
    func generateRandomNum (_ limit:Int, _ qut:Int) -> [Int]
    {
        //generate random numbers and store them with an array.
        var results = [Int]()
        let l = limit - 1
        
        while results.count < qut
        {
            results.append(Int(Int(arc4random_uniform(UInt32(l))) + 1))
        }
        return results
    }
    
    func alert(title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.default, handler:
            {
                (action) in alert.dismiss(animated: true, completion: nil)
            
            }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
