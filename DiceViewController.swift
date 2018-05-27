//
//  DiceViewController.swift
//  SIT206Assignment2DiceBot
//
//  Created by Tarate Tian on 9/5/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController
{
    
    var quantity = 1
    var limit = 0
    var resultArray = [Int]()
    var sum = 0
    var history = ""
    
    @IBOutlet weak var result: UITextView!
    @IBOutlet weak var qut4: UITextField!
    @IBOutlet weak var qut6: UITextField!
    @IBOutlet weak var qut8: UITextField!
    @IBOutlet weak var qut10: UITextField!
    @IBOutlet weak var qut12: UITextField!
    @IBOutlet weak var qut20: UITextField!
    @IBOutlet weak var qut100: UITextField!
    @IBOutlet weak var qut1000: UITextField!
    
    @IBAction func clearHistory(_ sender: UIButton)
    {
        history = ""
        result.text = ""
    }
    
    @IBAction func rollDn(_ sender: UIButton)
    {
        sum = 0
        resultArray = [Int]()
        
        switch (sender.tag)
        {
        case 4:
            limit = 4
            quantity = Int(qut4.text!)!
        case 6:
            limit = 6
            quantity = Int(qut6.text!)!
        case 8:
            limit = 8
            quantity = Int(qut8.text!)!
        case 10:
            limit = 10
            quantity = Int(qut10.text!)!
        case 12:
            limit = 12
            quantity = Int(qut12.text!)!
        case 20:
            limit = 20
            quantity = Int(qut20.text!)!
        case 100:
            limit = 100
            quantity = Int(qut100.text!)!
        case 1000:
            limit = 1000
            quantity = Int(qut1000.text!)!
        default:
            limit = 0
            quantity = 1
        }
        
        if quantity >= 20
        {
            quantity = 20
            //alert: you can roll up to 20 dices one time! rolling 20D(limit)
        }
        else if quantity <= 0
        {
            quantity = 1
            //alert: you need to roll at least 1 dice! rolling 1D(limit)
        }
        
        resultArray = generateRandomNum (limit, quantity)
        
        for i in resultArray
        {
            sum = sum + i
        }
        
        history = result.text!
        
        result.text = history + "\(quantity)" + "D" + "\(limit)" + ":" + "\(resultArray)" + " = " + String(sum) + "\n"
        let range = NSMakeRange(result.text.characters.count - 1, 0)
        result.scrollRangeToVisible(range)
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
