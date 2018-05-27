//
//  ResultViewController.swift
//  SIT206Assignment2DiceBot
//
//  Created by Tarate Tian on 27/5/18.
//  Copyright © 2018 Deakin. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
   
    var selectedResult = ""
    
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var descImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tittleLabel.text = selectedResult
        descImage.image = UIImage(named: selectedResult + ".png")
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
