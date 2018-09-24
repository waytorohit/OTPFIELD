//
//  OneTimePasswordViewController.swift
//  OminTrack
//
//  Created by Etelligens-M on 17/09/18.
//  Copyright © 2018 Etelligens. All rights reserved.
//

import UIKit

class OneTimePasswordViewController: UIViewController, UITextFieldDelegate {
    
    
    //MARK:- IBOUTLETS
    //MARK:-
    @IBOutlet weak var submitButton: UIButton!

    @IBOutlet var textFieldsOutletCollection: [UITextField]!
//    @IBOutlet weak var txtOTP1: UITextField!
//    @IBOutlet weak var txtOTP2: UITextField!
//    @IBOutlet weak var txtOTP3: UITextField!
//    @IBOutlet weak var txtOTP4: UITextField!
//    @IBOutlet weak var txtOTP5: UITextField!
//    @IBOutlet weak var txtOTP6: UITextField!
    
    
    //MARK:- VARIABLES
    //MARK:-
    var textFieldsIndexes:[UITextField:Int] = [:]
    
    //MARK:- CONSTANTS
    //MARK:-
   
    //MARK:- VIEWCONTROLLER LIFE CYCLE
    //MARK:-
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        for index in 0 ..< textFieldsOutletCollection.count {
            textFieldsIndexes[textFieldsOutletCollection[index]] = index
        }
        
        
        customizeTextField()
        
       //  let textFieldArray: [UITextField] = [txtOTP1, txtOTP2, txtOTP3, txtOTP4, txtOTP5, txtOTP6]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        submitButton.layer.cornerRadius = submitButton.layer.frame.height/10
    }
    
    //MARK:- TEXTFIELD CUSTOMIZATION
    //MARK:-
    private func customizeTextField() {
        
//        txtOTP1.backgroundColor = UIColor.clear; txtOTP2.backgroundColor = UIColor.clear; txtOTP3.backgroundColor = UIColor.clear; txtOTP4.backgroundColor = UIColor.clear
//        txtOTP5.backgroundColor = UIColor.clear; txtOTP6.backgroundColor = UIColor.clear
//
//        addBottomBorderTo(textField: txtOTP1); addBottomBorderTo(textField: txtOTP2); addBottomBorderTo(textField: txtOTP3); addBottomBorderTo(textField: txtOTP4);
//        addBottomBorderTo(textField: txtOTP5); addBottomBorderTo(textField: txtOTP6)
//
//        txtOTP1.delegate = self; txtOTP2.delegate = self; txtOTP3.delegate = self; txtOTP4.delegate = self; txtOTP5.delegate = self; txtOTP6.delegate = self
        
        
    }
    
    enum Direction { case left, right }
    
    func setNextResponder(_ index:Int?, direction:Direction) {
        
        guard let index = index else { return }
        
        if direction == .left {
            index == 0 ?
                (_ = textFieldsOutletCollection.first?.resignFirstResponder()) :
                (_ = textFieldsOutletCollection[(index - 1)].becomeFirstResponder())
        } else {
            index == textFieldsOutletCollection.count - 1 ?
                (_ = textFieldsOutletCollection.last?.resignFirstResponder()) :
                (_ = textFieldsOutletCollection[(index + 1)].becomeFirstResponder())
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.length == 0 {
            setNextResponder(textFieldsIndexes[textField], direction: .right)
            textField.text = string
            return true
        } else if range.length == 1 {
            setNextResponder(textFieldsIndexes[textField], direction: .left)
            textField.text = ""
            return false
        }
        return false
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool {
//
//        if (range.length == 0){
//            if textField == txtOTP1 {txtOTP2?.becomeFirstResponder()}
//            if textField == txtOTP2 {txtOTP3?.becomeFirstResponder()}
//            if textField == txtOTP3 {txtOTP4?.becomeFirstResponder()}
//            if textField == txtOTP4 {txtOTP5?.becomeFirstResponder()}
//            if textField == txtOTP5 {txtOTP6?.becomeFirstResponder()}
//            if textField == txtOTP6 {txtOTP6?.resignFirstResponder()}
//            textField.text? = string
//            return false
//        }
//        else if (range.length == 1) {
//
//            if textField == txtOTP6 {txtOTP5?.becomeFirstResponder()}
//            if textField == txtOTP5 {txtOTP4?.becomeFirstResponder()}
//            if textField == txtOTP4 {txtOTP3?.becomeFirstResponder()}
//            if textField == txtOTP3 {txtOTP2?.becomeFirstResponder()}
//            if textField == txtOTP2 {txtOTP1?.becomeFirstResponder()}
//            if textField == txtOTP1 {txtOTP1?.resignFirstResponder()}
//
//            textField.text? = ""
//            return false
//        }
//        return true
//    }
    
    //MARK:- BUTTON ACTION METHODS
    //MARK:-
   
    
    
    //MARK:- ADDING BOTTOM BORDER ON TEXTFIELD
    //MARK:-
    func addBottomBorderTo(textField:UITextField) {
        let layer = CALayer()
        layer.backgroundColor = UIColor.lightGray.cgColor
        layer.frame = CGRect(x: 0.0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 0.5)
        textField.layer.addSublayer(layer)
    }
    
    
    
}
