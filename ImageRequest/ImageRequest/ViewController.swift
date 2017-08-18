//
//  ViewController.swift
//  ImageRequest
//
//  Created by Jarrod Parkes on 11/3/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var loadImageLabel: UILabel!
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Define the URL we will gonna use
        let imageURL = URL(string: "http://www.liptonicetea.com/nl-BE/images/products/91/productsbigbottlegreen-ice-tea.png")
        
        
        //Define the task that is gonna execute
        let task = URLSession.shared.dataTask(with: imageURL!)  { ( data,response,Error )  in
        
            //If everything is okay and there is no errors !
            if Error == nil {
                
                let downloadedImage = UIImage(data: data!)
                
                //This function makes UIUpdatings on the main area , so we immadately see the updates.
                performUIUpdatesOnMain {
                    self.loadImageLabel.alpha = 0
                    self.imageView.image = downloadedImage
                }
                
                
            }else { //If there is an error !
                print("Fuck somethings is bad Onur ...")
            }
            
        }
        
        //Start the task !
        task.resume()
    
    }
}
