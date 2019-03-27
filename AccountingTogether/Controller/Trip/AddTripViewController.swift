//
//  AddTripViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 23/03/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import CoreData
import Foundation
import Photos


class AddTripViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var imgView: UIImageView!
    
    var newTrip: Trip? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkPermission()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTrip(_ sender: Any) {
        let inputs: [String: UITextField] = ["name": nameTF]
        if FormValidatorHelper.validateForm(inputs){
            do{
                newTrip = try Trip.create(withName: nameTF.text!/*, withImage: imgView*/)
                self.dismiss(animated: true, completion: nil)
            }catch{
                DialogBoxHelper.alert(view: self, errorMessage: "Ajout du voyage échoué")
            }
            
        }else{
            DialogBoxHelper.alert(view: self, WithTitle: "Erreur", andMessage: "Données du formulaire invalides", closure: nil)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func btnSetProfileImageClickedCamera(_ sender: UIButton) {
    }
    
    @IBAction func btnSetProfileImageClickedFromGallery(_ sender: UIButton) {
        self.selectPhotoFromGallery()
    }
    
    func selectPhotoFromGallery() {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imgView.contentMode = .scaleAspectFit
            self.imgView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        print("cancel is clicked")
        dismiss(animated: true, completion: nil)
    }
    
    
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            print("Access is granted by user")
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({
                (newStatus) in
                print("status is \(newStatus)")
                if newStatus ==  PHAuthorizationStatus.authorized {
                    /* do stuff here */
                    print("success")
                }
            })
            print("It is not determined until now")
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        }
    }
    
}
