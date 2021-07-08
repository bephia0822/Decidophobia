//
//  ViewController.swift
//  Decidophobia
//
//  Created by Sophia Wang on 2021/4/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var chosenResult: String?
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return.lightContent
    }

    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var myTextInput: UITextField!
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let text = myTextInput.text{
            if text != ""{
               options.append(text)
               myTableView.reloadData()
            }
        }
        myTextInput.text = ""
        myTextInput.resignFirstResponder()
    }
    
    
    @IBAction func startPressed(_ sender: UIButton) {
        let result = options.randomElement()
        chosenResult = result!
        self.performSegue(withIdentifier: "goToResult", sender: self)
        options.removeAll()
        myTableView.reloadData()
    }
    
    var options = [String]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        myTextInput.delegate = self
        myTextInput.becomeFirstResponder()
        
        //透過手勢(addGestureRecognizer)完成鍵盤消失的效果
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
                self.view.addGestureRecognizer(tap) // to Replace "TouchesBegan"
        
    }
    
    @objc func dismissKeyBoard() {
            self.view.endEditing(true)
        }
    
    //點擊空白處鍵盤消失
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    //顯示的字型及顏色
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = UIFont(name: "Rabbit Garden", size: 30)
        
        return cell
    }
    
    
    
    
    //往左滑能刪除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            options.remove(at: indexPath.row)
            myTableView.reloadData()
        }
        
    }
    
    
    
    //按到不會反白
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    //按鍵盤return也能輸入
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        buttonPressed(UIButton())
        return true
    }
    
    //點擊Return鍵鍵盤下去
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        myTextInput.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ResultViewController {
            destinationVC.resultText = chosenResult
        }
        
    }
}

 
