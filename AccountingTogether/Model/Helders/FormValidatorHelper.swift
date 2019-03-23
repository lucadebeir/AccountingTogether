//
//  FormValidatorHelper.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit

class FormValidatorHelper {
    
    /// Vérifier que les inputs d'un formulaire sont non vides
    ///
    /// - Renvoie vrai si tous les inputs sont remplis
    /// - Renvoie faux si au moins un input est vide
    ///
    /// - Parameters:
    ///   - inputs: `[String: UITextField]` inputs du Formulaire
    class func validateForm(_ inputs: [String: UITextField])-> Bool {
        // Filtrer les valeurs optionnelles (textField vide)
        let res = inputs.filter{(key, input) in !(input.text?.isEmpty ?? true)}
        // Si même taille alors pas de valeurs vides
        return res.count == (inputs.count)
    }
}
