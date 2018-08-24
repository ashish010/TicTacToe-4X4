//
//  ThirdViewController.swift
//  Assignment1
//
//  Created by Pratistha Sthapit on 4/12/18.
//  Copyright © 2018 Ashish Khadka. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var player1Name: UITextField!
    
    @IBOutlet weak var player2Name: UITextField!
    var xORoTag = "o_"
    var iconTag1 = -1
    var iconTag2 = -1
    
    @IBAction func xORoSlider(_ sender: UISwitch) {
        if !sender.isOn{
            xORoTag = "x_"
        }
        else{
            xORoTag = "o_"
        }
    }
    @IBAction func chooseIcon1(_ sender: UIButton) {
        iconTag1 = sender.tag
        
    }
    
    @IBAction func ChooseIcon2(_ sender: UIButton) {
        iconTag2 = sender.tag
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tv = segue.destination as! GameViewController
        
        tv.xOro = xORoTag
        tv.iconImg1 = iconTag1
        tv.iconImg2 = iconTag2
        if(player1Name.text != ""){
            tv.stringValue = player1Name.text!
        }else{
            tv.stringValue = "Player 1"
        }
        if(player2Name.text != ""){
            tv.stringValue1 = player2Name.text!
        }else{
            tv.stringValue1 = "Player 2"
        }
        
        
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
