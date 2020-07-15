//
//  DetailViewController.swift
//  DailyOracle
//
//  Created by Theodora on 7/15/20.
//  Copyright © 2020 Feodora Andryieuskaya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.shadowOffset = CGSize(width: 5, height: 5)
            imageView.layer.shadowOpacity = 0.5
            imageView.layer.shadowRadius = 10
        }
    }
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var mood: UITextField!
    @IBOutlet weak var color: UITextField!
    @IBOutlet weak var luckyNumber: UITextField!
    @IBOutlet weak var luckyTime: UITextField!
    
    var musicOn = true
    var signImage: UIImage?
    var signText: String?
    var signMood: String?
    var signColor: String?
    var signLuckyNumber: String?
    var signLuckyTime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = signImage
        textView.text = signText
        mood.text = "Mood: \(signMood!)"
        color.text = "Color: \(signColor!)"
        luckyNumber.text = "LuckyNumber: \(signLuckyNumber!)"
        luckyTime.text = "LuckyTime: \(signLuckyTime!)"
    }
    
    @IBAction func musicButton(_ sender: UIButton) {
        
        if musicOn {
            musicOn = false
            PlayerService.getPlayer().stop()
        } else {
            musicOn = true
            PlayerService.getPlayer().play()
        }
    }
}
