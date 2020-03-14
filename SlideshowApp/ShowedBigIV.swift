//
//  ShowdeBigIV.swift
//  SlideshowApp
//
//  Created by 上江洲大輝 on 2020/03/07.
//  Copyright © 2020 jp.techacademy. All rights reserved.
//

import UIKit

class ShowedBigIV: UIViewController {
    
    
    @IBOutlet weak var showedImage2: UIImageView!
    
    var imageNumber = 0
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageNumber2 = imageNumber
        showedImage2.image = UIImage(named: "\(imageNumber2)")
    
    }
    

    
    
    
    
    

}
