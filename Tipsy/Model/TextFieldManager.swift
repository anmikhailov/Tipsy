//
//  TextFieldManager.swift
//  Tipsy
//
//  Created by Andrey on 27.04.2023.
//

import UIKit

class NoPasteTextFieldDelegate: NSObject, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Если длина строки замены больше 1, это означает, что пользователь пытается вставить текст
        if string.count > 1 {
            return false
        }
        
        return true
    }
}
