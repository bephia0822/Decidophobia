//
//  ResultViewController.swift
//  Decidophobia
//
//  Created by Sophia Wang on 2021/4/20.
//

import UIKit

class ResultViewController: UIViewController {
    
    var resultText: String?
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }
    
    
    
    @IBOutlet weak var myGifView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myGifView.loadGif(name: "koupenchan")
        resultLabel.text = resultText
        
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    
    @IBAction func restartPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
