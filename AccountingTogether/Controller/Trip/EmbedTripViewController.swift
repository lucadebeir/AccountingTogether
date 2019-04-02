//
//  EmbedTripViewController.swift
//  AccountingTogether
//
//  Created by Luca Debeir on 01/04/2019.
//  Copyright © 2019 Luca Debeir. All rights reserved.
//

import UIKit
import Photos

class EmbedTripViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var imageTrip: UIImageView!
    @IBOutlet weak var dateFrom: UIDatePicker!
    @IBOutlet weak var dateTo: UIDatePicker!
    @IBOutlet var tableTravellerEmbedTravel: TableTravellerEmbedViewController!

    var travellers: [Traveller] = []
    var newTrip : Trip?
    
    override func viewDidLoad() {
        
        if let tripToUpdate = self.newTrip {
            self.nameTF.text = tripToUpdate.title
        }
        
        checkPermission()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
    }
    // preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "addTrip" { //UNWIND LINK
            let nameTrip : String  = self.nameTF.text!
            self.newTrip = Trip(t: nameTrip, i: imageTrip.image!)
            for t in travellers {
                t.participates = self.newTrip
            }
        }
        else if segue.identifier == "cancel"{
            if let tripToCancel = self.newTrip {
                TripDAO.delete(trip: tripToCancel)
                
            }
            
        }
        else{
            self.newTrip = nil
        } }
    
    
    // MARK: - TextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text{
            if text != ""{
                textField.resignFirstResponder()
                return true
            } }
        return false
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
            self.imageTrip.contentMode = .scaleAspectFit
            self.imageTrip.image = pickedImage
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
    
    
    @IBAction func addParticipantsTraveller(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Traveller to this Trip ", message: "Insert Traveller", preferredStyle: .alert)
        
        
        alert.addTextField { (firstName) in
            firstName.placeholder = "Firstname..."
        }
        alert.addTextField { (lastName) in
            lastName.placeholder = "Lastname..."
        }
        
        let saveAction = UIAlertAction(title: "SAVE", style: .default) {
            
            [unowned self] action in
            guard let textFields = alert.textFields,  let firstName = textFields[0].text,  let lastName = textFields[1].text else {
                return
            }
            
            
            let traveller = Traveller(lastName: lastName, firstName: firstName)
            self.travellers.append(traveller)
            self.tableTravellerEmbedTravel.travellerSetViewModel.add(traveller: traveller)
            
            
        }
        let cancelAction = UIAlertAction(title: "CANCEL", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}
