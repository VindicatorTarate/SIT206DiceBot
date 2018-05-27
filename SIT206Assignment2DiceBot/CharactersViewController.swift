//
//  CharactersViewController.swift
//  SIT206Assignment2DiceBot
//
//  Created by Tarate Tian on 9/5/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
    
    var quantity = 1
    var limit = 0
    var resultArray = [Int]()
    var result = 0
    var resultText = ""
    var sum = 0
    var bonus = 0
    var abilityText = ""
    var alertTitle = "Result"
    
    @IBOutlet weak var atkBonus1: UITextField!
    @IBOutlet weak var atkBonus2: UITextField!
   
    @IBOutlet weak var dmgQ1: UITextField!
    @IBOutlet weak var dmgQ2: UITextField!
    @IBOutlet weak var dmg1: UITextField!
    @IBOutlet weak var dmg2: UITextField!
    @IBOutlet weak var dmgB1: UITextField!
    @IBOutlet weak var dmgB2: UITextField!
    
    @IBAction func attackRoll(_ sender: UIButton)
    {
        sum = 0
        result = 0
        resultArray = [Int]()
        resultText = ""
        
        switch (sender.tag)
        {
        case 101:
            quantity = 1
            limit = 20
            bonus = Int(atkBonus1.text!)!
            
        case 102:
            quantity = 1
            limit = 20
            bonus = Int(atkBonus2.text!)!
            
        default:
            quantity = 1
            limit = 1
            bonus = 0
        }
        result = generateRandomNum (limit, quantity)[0] + bonus
        resultText = "Attack check: " + String(result)
        
        switch (sender.tag)
        {
        case 101:
            quantity = Int(dmgQ1.text!)!
            limit = Int(dmg1.text!)!
            bonus = Int(dmgB1.text!)!
            
        case 102:
            quantity = Int(dmgQ2.text!)!
            limit = Int(dmg2.text!)!
            bonus = Int(dmgB2.text!)!
            
        default:
            quantity = 1
            limit = 1
            bonus = 0
        }
        resultArray = generateRandomNum (limit, quantity)
        for i in resultArray
        {
            sum = sum + i
        }
        result = sum + bonus
        resultText = resultText + "\n" + "Damage: " + String(result)
        
        //alert: resultText
        alert(title: alertTitle, message: resultText)

    }
    
    @IBOutlet weak var abilityScore1: UITextField!
    @IBOutlet weak var abilityScore2: UITextField!
    @IBOutlet weak var abilityScore3: UITextField!
    @IBOutlet weak var abilityScore4: UITextField!
    @IBOutlet weak var abilityScore5: UITextField!
    @IBOutlet weak var abilityScore6: UITextField!
    @IBOutlet weak var savingB1: UITextField!
    @IBOutlet weak var savingB2: UITextField!
    @IBOutlet weak var savingB3: UITextField!
    @IBOutlet weak var savingB4: UITextField!
    @IBOutlet weak var savingB5: UITextField!
    @IBOutlet weak var savingB6: UITextField!
    
    
    
    @IBAction func abilityCheck(_ sender: UIButton)
    {
        sum = 0
        result = 0
        resultText = ""
        abilityText = ""
        quantity = 1
        limit = 20
        bonus = 0
        
        
        
        
        switch (sender.tag)
        {
        case 111:
            abilityText = "STR"
            bonus = Int(abilityScore1.text!)!
            bonus = (bonus - 10)/2
        case 112:
            abilityText = "DEX"
            bonus = Int(abilityScore2.text!)!
            bonus = (bonus - 10)/2
        case 113:
            abilityText = "CON"
            bonus = Int(abilityScore3.text!)!
            bonus = (bonus - 10)/2
        case 114:
            abilityText = "INT"
            bonus = Int(abilityScore4.text!)!
            bonus = (bonus - 10)/2
        case 115:
            abilityText = "WIS"
            bonus = Int(abilityScore5.text!)!
            bonus = (bonus - 10)/2
        case 116:
            abilityText = "CHA"
            bonus = Int(abilityScore6.text!)!
            bonus = (bonus - 10)/2
        case 121:
            abilityText = "STR saving"
            bonus = Int(savingB1.text!)!
        case 122:
            abilityText = "DEX saving"
            bonus = Int(savingB2.text!)!
        case 123:
            abilityText = "CON saving"
            bonus = Int(savingB3.text!)!
        case 124:
            abilityText = "INT saving"
            bonus = Int(savingB4.text!)!
        case 125:
            abilityText = "WIS saving"
            bonus = Int(savingB5.text!)!
        case 126:
            abilityText = "CHA saving"
            bonus = Int(savingB6.text!)!
        default:
            abilityText = "Unknown Ability"
        }
        
        result = generateRandomNum (limit, quantity)[0] + bonus
        resultText = abilityText + " check result: " + String(result)
        
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
