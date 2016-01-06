//
//  ViewController.swift
//  Coin Tapper
//
//  Created by Brandon Ellis on 1/6/16.
//  Copyright © 2016 Brandon Ellis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //this got rid of the keyboard with helo of function below
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        //trying to hide keyboard on return button
        self.inputText.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Variables
    var maxTaps: Int = 0   //explicit declaration
    var currTaps = 0  //implicit declaration
    
    
    //Outlets
    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    
    @IBAction func onPlaButtonPressed(sender: UIButton!){
        if inputText.text != nil && inputText.text != "" {
            maxTaps = Int(inputText.text!)!
            currTaps = 0
            
            titleImg.hidden = true
            inputText.hidden = true
            playButton.hidden = true
            
            tapButton.hidden = false
            countLabel.hidden = false
            
            updateTapsLabel()
        }
    }
    
    @IBAction func onCoinTap(sender: UIButton!){
        ++currTaps
        updateTapsLabel()
        if isGameOver() {
            restartGame()
        }
    }
    
    func updateTapsLabel() {
        countLabel.text = "\(currTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if currTaps >= maxTaps{
            return true
        }
        else{
            return false
        }
    }
    
    func restartGame(){
        maxTaps = 0
        countLabel.text = ""

        
        titleImg.hidden = false
        inputText.hidden = false
        playButton.hidden = false
        
        tapButton.hidden = true
        countLabel.hidden = true
    }
    
    //this helped get rid of keyboard
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    //trying to hide keyboard on return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}

