//
//  ViewController.swift
//  OTUSUIViewController
//
//  Created by Dmitry Chicherin on 24/4/2566 BE.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var alertText: UILabel!
    @IBOutlet weak var fioField: UITextField!
    @IBOutlet weak var toggleHideButton: UIButton!
    @IBOutlet weak var copyAddressButton: UIButton!
    @IBOutlet weak var addressField: UITextField!
    
    var enteredFIO = ""
    var fioHidden = false
    var fio = ""
    var address = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if alertText != nil{
            alertText.text = ""
        }
        if addressField != nil
        {
            addressField.text = address
        }
        if fioField != nil
        {
            fioField.text = fio
        }
    }
    

    @IBAction func toggleHideButtonTapped(_ sender: Any) {
        
        
        let fioPattern = try! Regex("^.[a-zA-Zа-яА-Я]+\\s[a-zA-Zа-яА-Я]+\\s.[a-zA-Zа-яА-Я]+$")
        let fioToTest = fioField.text ?? ""
        //Проверяем, спрятано ли фио
        if !fioHidden {
            //Проверяем, состоит ли ФИО из 3 слов
            if fioToTest.contains(fioPattern) {
                alertText.text = ""
                enteredFIO = fioField.text!
                let nameComponents = enteredFIO.components(separatedBy: " ")
                fioField.text = "**** " + nameComponents[1] + " ****"
                fioHidden = true
                
            }
            else  {
                alertText.text = "Неправильный формат ФИО!"
                toggleHideButton.tintColor = UIColor.red
                Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(setButtonBlue), userInfo: nil, repeats: false)
            }
        }
        else {
            fioField.text = enteredFIO
            fioHidden = false
        }
    }
    
    //Копируем содержимое адреса в буффер обмена
    @IBAction func copyAddressButtonTapped(_ sender: Any) {
        let pasteboard = UIPasteboard.general
        pasteboard.string = addressField.text
    }
    
    @objc func setButtonBlue()
    {
        toggleHideButton.tintColor = UIColor.systemBlue
    }
    
}
