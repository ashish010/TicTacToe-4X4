//
//  ViewController.swift
//  Assignment1
//
//  Created by Pratistha Sthapit on 4/10/18.
//  Copyright © 2018 Ashish Khadka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var homeScreen: UIImageView!
    
    @IBAction func player_name(_ sender: UITextField) {
        player1Name = sender.text!
    }
   
    
    
    //var
    var pMode : Int = 1
    var player1Name : String = ""
    var player2Name : String = ""
    
    var imgs : [UIImage] = [UIImage (named:"o")!, UIImage (named:"x")!, UIImage (named:"batman")!, UIImage (named:"deadpool")!, UIImage (named: "hulk")!, UIImage (named: "chunli")!, UIImage (named: "spiderwoman")!, UIImage(named:"sakura")!]
    
    
    @IBAction func playerMode(_ sender: UIButton) {
        
        if (sender.tag == 1){
            pMode = 1
        }
        else{
            pMode = 2
        }
        
    }
    
   
    
    
}

