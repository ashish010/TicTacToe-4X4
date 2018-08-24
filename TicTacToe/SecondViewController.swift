//
//  SecondViewController.swift
//  Assignment1
//
//  Created by Pratistha Sthapit on 4/11/18.
//  Copyright © 2018 Ashish Khadka. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var playerName: UITextField!
    
    var xORoTag = "o_"
    var iconTag = -1
    
    
    @IBAction func chooseIcon(_ sender: UIButton) {
    iconTag = sender.tag
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func xORoSlider(_ sender: UISwitch) {
        if !sender.isOn{
            xORoTag = "x_"
        }
        else{
            xORoTag = "o_"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let targetView = segue.destination as! SinglePlayerGameViewController
        //targetView.value = 2
        if(playerName.text != ""){
            targetView.stringValue = playerName.text!
        }else{
            targetView.stringValue = "Player 1"
        }
        targetView.stringValue1 = "Computer"
        targetView.xOro = xORoTag
        targetView.iconImg1 = iconTag
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
