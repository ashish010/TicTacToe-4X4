//
//  SinglePlayerGameViewController.swift
//  Assignment1
//
//  Created by Pratistha Sthapit on 4/15/18.
//  Copyright © 2018 Ashish Khadka. All rights reserved.
//

import UIKit

class SinglePlayerGameViewController: UIViewController {

    var stringValue1 = String()
    var stringValue = String()
    var xOro = String()
    var iconImg1 = -1
    var iconImg2 = -1
    var images: [UIImage] = [UIImage (named:"o")!, UIImage (named:"x")!, UIImage (named:"batman")!, UIImage (named:"deadpool")!, UIImage (named: "hulk")!, UIImage (named: "chunli")!, UIImage (named: "spiderwoman")!, UIImage(named:"sakura")!]
    var imgs : [String] = ["o","x","batman","deadpool","hulk","chunli", "spiderwoman","sakura"]
    var gameStart = false
    var gameStarter = ""
    var secondStarter = ""
    var gameStarterState = -1
    var secondStarterState = -1
    var first = ""
    var PlayerTurn = -1
    var winner = ""
    var _retry = false
    var player1symbol = ""
    var player2symbol = ""
    var continueGame = ""
    var historyString = ""
    var messageTitle = ""
    var count = 0
    var finalcount = 0
    var totalGame = 0
    var gameState = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    var gameStatus = true
    var win = [[0,5,10,15], [3,6,9,12], [0,4,8,12], [0,1,2,3], [3,7,11,15], [12,13,14,15], [1,5,9,13], [2,6,10,14], [8,9,10,11], [4,5,6,7]]
    @IBOutlet weak var player1NameLabel: UILabel!
    @IBOutlet weak var player2NameLabel: UILabel!
    @IBOutlet weak var xORoImage: UIImageView!
    @IBOutlet weak var Icon1: UIImageView!
    @IBOutlet weak var Icon2: UIImageView!
    @IBOutlet weak var xORoImage2: UIImageView!
    @IBOutlet weak var GameView: UIImageView!
    @IBOutlet weak var P2ScoreLabel: UILabel!
    @IBOutlet weak var P1ScoreLabel: UILabel!
    
    
    
    @IBAction func GameButton(_ sender: UIButton)
    {
        
        GameStart() // Starts the Game
        if (gameState[sender.tag-1] == 0 && gameStatus == true){
           
            
            playerMove(_sender: sender) //Player's move is recorded
            checkWinner() //checks if there is a winner
            
            if (winner == "Player 1 Won"){
                P1ScoreLabel.text! = "\(Int(P1ScoreLabel.text!)! + 1)"
                messageTitle = "\(player1NameLabel.text!) Won!"
                gameStatus = false
                historyString = "\(historyString)\n\(messageTitle)"
            }
            else if (winner == "Player 2 Won"){
                P2ScoreLabel.text! = "\(Int(P2ScoreLabel.text!)! + 1)"
                messageTitle = "\(player2NameLabel.text!) Won!"
                gameStatus = false
                historyString = "\(historyString)\n\(messageTitle)"
            }
            
        }
        if(gameStatus == false){
            retryGame()
        }
        
    }
    
    
    @IBOutlet var buttons: [UIButton]!
    
    
    
    func playerMove(_sender : UIButton)
    {
        if gameStatus == true && count != 2 //Player is allowed two turns each time
        {
            count = count + 1 // count to ensure player only puts two symbols in each turn
            if player1symbol == "o"{
                
                _sender.setBackgroundImage(images[0], for: .normal)
                PlayerTurn = 1 //Turn of the player if they chose nought
            }else{
                _sender.setBackgroundImage(images [1], for: .normal)
                PlayerTurn = 2 //Turn of the player if they chose cross
            }
            
            gameState[_sender.tag-1] = PlayerTurn // Array value changed to show tile is filled
            
            if (count == 2){
                gameStatus = false
                for i in 0..<16{
                    if gameState[i] == 0{
                        gameStatus = true
                        break
                    }
                }
                ComputerMove() //Computer's turn
            }
        }
        
    }
    
    func ComputerMove()
    {
        count = 0 //count to ensure computer only places two symbols in one turn
       
        var nums = Array (0..<16) //an array of size 16 from 0 to 15 is created to mimic the variable gameState
        
        while count != 2 && gameStatus == true //Still computer's turn and state of the game is checked
        {
            for i in gameState {
                if i == 0
                {
                    var _a = Int (arc4random_uniform(UInt32(nums.count))) //random number is generated with numbers nums array
                    
                    print (_a)
                    if gameState[_a] == 0 //tile empty condition check
                    {
                        count = count + 1
                        if (player2symbol == "o") {
                            buttons[_a].setBackgroundImage(images[0], for: .normal)
                            PlayerTurn = 1
                            gameState[_a] = PlayerTurn // Turn if nought
                            
                        }else{
                            buttons[_a].setBackgroundImage(images[1], for: .normal)
                            PlayerTurn = 2
                            gameState[_a] = PlayerTurn // Turn if cross
                            
                        }

                         _a = nums.remove(at: _a) // elements at nums is removed to indicate the space is filled
                        break
                    }
                    
                   
                }
                //checking if game is active
                gameStatus = false
                for i in 0..<16{
                    if gameState[i] == 0{
                        gameStatus = true
                        break //breaks off the closest loop if the game is still active
                    }
                }
                
                
            }
        }
        count = 0
        
        
    }
    func GameStart(){
        
        if (gameStart == false){
            totalGame = totalGame + 1
            if self.first == "player 1"{
                if (xOro == "o_"){
                    PlayerTurn = 1
                    gameStarter = "player 1"
                    gameStarterState = 1
                    secondStarter = "player 2"
                    secondStarterState = 2
                
                }else {
                    PlayerTurn = 2
                    gameStarter = "player 1"
                    gameStarterState = 2
                    secondStarter = "player 2"
                    secondStarterState = 1
                    
                }
                
            }else{
                if (xOro == "o_"){
                    PlayerTurn = 2
                    gameStarter = "player 2"
                    gameStarterState = 2
                    secondStarter = "player 1"
                    secondStarterState = 1
                    
                    
                }else {
                    PlayerTurn = 1
                    gameStarter = "player 2"
                    gameStarterState = 1
                    secondStarter = "player 1"
                    secondStarterState = 2
                   
                }
                
            }
            print (gameStarter)
            print (gameStarterState)
            print("_")
            gameStart = true
            
            
           
        }
    }
    func _ContinueGame () // continue the game after each game
    {   //reset the buttons but keep the score intact
        gameState = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        gameStatus = true
        GameView.image = UIImage (named: "grid")
        for _tags in 1...16{
            let Button = view.viewWithTag(_tags) as! UIButton
            Button.setBackgroundImage(nil, for: UIControlState())
            
        }
        gameStart = false
        gameStarter = ""
        secondStarter = ""
        gameStarterState = -1
        secondStarterState = -1
        first = ""
        PlayerTurn = -1
        count = 0
        winner = ""
        
        
        firstToGo()
    }
    @IBAction func Restart(_ sender: UIButton)// action handler for restart button touched
    { //reset score labels and remove history data
        P2ScoreLabel.text = "0"
        P1ScoreLabel.text = "0"
        totalGame = 0
        historyString = ""
        _ContinueGame()
        
    }
    
    func retryGame () {
        let _alert = UIAlertController(title: "Game Over", message: "\(messageTitle) \n Would you like to continue playing?", preferredStyle: .alert)
        
        _alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { (action: UIAlertAction!) in
            self._ContinueGame()
        }))
        
        
        _alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(_alert, animated: true)
        
        
    }
    func checkWinner () {
        
        for combination in win{
            
            if gameState[combination[0]] != 0 && gameState [combination[0]] == gameState [combination[1]] && gameState [combination [1]] == gameState [combination [2]] && gameState [combination[2]] == gameState[combination[3]]
            {
                
                gameStatus = false
                if gameState[combination[0]] == 1{
                    
                    GameView.image = UIImage (named: "o")
                    
                    if (gameStarterState == 1 && gameStarter == "player 1"){
                        winner = "Player 1 Won"
                    }else if(gameStarterState == 1 && gameStarter == "player 2") {
                        winner = "Player 2 Won"
                    }else if (secondStarterState == 1 && secondStarter == "player 1"){
                        winner = "Player 1 Won"
                    }else {
                        winner = "Player 2 Won"
                    }
                    
                    
                }
                else{
                    GameView.image = UIImage (named: "x")
                    
                    
                  if (gameStarterState == 2 && gameStarter == "player 2"){
                        winner = "Player 2 Won"
                    }else if (gameStarterState == 2 && gameStarter == "player 1") {
                        winner = "Player 1 Won"
                    } else if (secondStarterState == 2 && secondStarter == "player 2"){
                        winner = "Player 2 Won"
                    }else{
                        winner = "Player 1 Won"
                    }
                    
                    
                }
                
                
                
            }
            
            
        }
        
        gameStatus = false
        
        for i  in gameState {
            
            if i == 0{
                gameStatus = true
                break
            }
            
        }
        if (gameStatus == false && winner == "")
        {
            winner = "Draw"
            messageTitle = "Draw"
            historyString = "\(historyString)\n\(messageTitle)"
            
        }
        
        
        
        
        
        
        
    }
    func firstToGo(){
        let _alert = UIAlertController(title: "Who would like to start first?", message: "Do a rock paper scissors!", preferredStyle: .alert)
        
        _alert.addAction(UIAlertAction(title: stringValue, style: .default, handler: { (action: UIAlertAction!) in
            self.first = "player 1"
            
        }))
        
        
        _alert.addAction(UIAlertAction(title: stringValue1, style: .default, handler: { (action: UIAlertAction!) in
            self.first = "player 2";
            self.ComputerMove()
            
        }))
        
        self.present(_alert, animated: true)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //label.text = stringValue
        
        firstToGo()
        player1NameLabel.text = stringValue
        
        if (player2NameLabel.text != ""){
            player2NameLabel.text = stringValue1
        }else{
            player2NameLabel.text = "Computer"
        }
        
        xORoImage.image = UIImage(named:xOro)
        if xOro != "x_"{
            xORoImage2.image = UIImage(named:"x_")
            player1symbol = "o"
            player2symbol = "x"
        }else{
            xORoImage2.image = UIImage (named:"o_")
            player1symbol = "x"
            player2symbol = "o"
        }
        
        if iconImg1 != -1{
            Icon1.image = UIImage (named:(imgs[iconImg1]))
        }
        
        if iconImg2 != -1{
            Icon2.image = UIImage (named: imgs[iconImg2])
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let historyView = segue.destination as! HistoryViewController
        historyView._history = "\(historyString)"
        historyView.total = "\(totalGame)"
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
