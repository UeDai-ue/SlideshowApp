//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 上江洲大輝 on 2020/03/06.
//  Copyright © 2020 jp.techacademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var buttonTapCount = 0
    var imageNumber = 0
    
    @IBOutlet weak var pastButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var stratButton: UIButton!
    
    @IBOutlet weak var showedImage1: UIImageView!
    
    var timer: Timer!
    
    func startTimer() {
        if self.timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
        }
    }
    @objc func timerUpdate(){
        imageNumber += 1
        imageCycle()
        showedImage1.image = UIImage(named: "\(imageNumber)")
    }
    
    func imageCycle(){
        if imageNumber < 0 {
            imageNumber = 2
        }else if imageNumber > 2 {
            imageNumber = 0
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if self.timer != nil {
            self.timer.invalidate()   // タイマーを停止する
            self.timer = nil
        }
        let showedBigIV:ShowedBigIV = segue.destination as! ShowedBigIV
        showedBigIV.imageNumber = imageNumber
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func showPastIV(_ sender: Any) {
        
        imageNumber -= 1
        
        imageCycle()
        
        showedImage1.image = UIImage(named: "\(imageNumber)")
        
    }
    
    
    @IBAction func showNextIV(_ sender: Any) {
        
        imageNumber += 1
        
        imageCycle()
        
        showedImage1.image = UIImage(named: "\(imageNumber)")
        
    }
    
    
    @IBAction func stratButton(_ sender: Any) {
        buttonTapCount += 1
        
        
        if buttonTapCount == 1{
            
            if self.timer == nil {
                startTimer()
            }
            
            stratButton.setTitle("停止", for: .normal)
            
            pastButton.isEnabled = false
            nextButton.isEnabled = false
            
            pastButton.setTitleColor(UIColor.gray, for: .normal)
            nextButton.setTitleColor(UIColor.gray, for: .normal)
            

            
        }else{
            
            if self.timer != nil {
                self.timer.invalidate()   // タイマーを停止する
                self.timer = nil
            }
            
            buttonTapCount = 0
            stratButton.setTitle("再生", for: .normal)
            
            pastButton.setTitleColor(UIColor.systemBlue, for: .normal)
            nextButton.setTitleColor(UIColor.systemBlue, for: .normal)
            
            pastButton.isEnabled = true
            nextButton.isEnabled = true
            
        }
        
    }
    
    
    
    
    
    
}

