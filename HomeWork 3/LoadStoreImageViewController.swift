//
//  LoadStoreImageViewController.swift
//  HomeWork 3
//
//  Created by Abdullah on 2/9/17.
//  Copyright © 2017 Abdullah. All rights reserved.
//

import UIKit

class LoadStoreImageViewController: UIViewController {
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveButton(_ sender: UIButton) {
        
        if let urlText = urlTextField.text {
            if let url = URL(string: urlText) {
        
        let request = NSMutableURLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                
                print("error")
                
            } else {
                
                if let data = data {
                    
                    if let image = UIImage(data: data) {
                        
                        self.imageView.image = image
                        
                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                        
                        if documentsPath.count > 0 {
                            
                            let documentsDirectory = documentsPath[0]
                            
                            let savePath = documentsDirectory + "/currentImage.jpg"
                            
                            do {
                                
                                try UIImageJPEGRepresentation(image, 1)?.write(to: URL(fileURLWithPath: savePath))
                                
                            } catch {
                                
                                // process error
                                
                            }
                            
                            
                            
                        }
                        
                        
                    }
                    
                }
                
                
            }
            
        }
        task.resume()
        }
        }
    }
    @IBAction func loadButton(_ sender: Any) {
        loadImage()
    }
    
    func loadImage () {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        if documentsPath.count > 0 {
            
            let documentsDirectory = documentsPath[0]
            
            let restorePath = documentsDirectory + "/currentImage.jpg"
            
            imageView.image = UIImage(contentsOfFile: restorePath)
            
            
            
            
        }

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
