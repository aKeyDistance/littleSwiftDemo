//
//  ViewController.swift
//  AirDropDemo
//
//  Created by Shaw on 07/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit
import MediaPlayer
import MobileCoreServices

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func sendButton(_ sender: UIButton) {
        
        let image = imageView.image!
        let activityController = UIActivityViewController(activityItems:[image], applicationActivities:nil)
        
        self.present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func cameraButton(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.showsCameraControls = true
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func photoButton(_ sender: UIButton) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    func imageView(_ image: UIImage, didFinishSavingWithError error: NSErrorPointer?, contextInfo: UnsafeRawPointer){
        if(error != nil){
            print("ERROR IMAGE \(error.debugDescription)")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let sourceImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        if imageView != nil {
            imageView.image = sourceImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

