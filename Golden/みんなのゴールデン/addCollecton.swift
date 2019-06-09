//
//  addCollecton.swift
//  Pods-Golden
//
//  Created by 笹倉一也 on 2019/05/29.
//

import UIKit
import RealmSwift

class addCollecton: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextViewDelegate {
    
    
    var myImage:UIImage? = nil
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if imageView.image == nil {
            let image1 = UIImage(named: "no_image")
            imageView.image = image1
        }
        
        self.textView.layer.cornerRadius = 4
        self.imageView.layer.cornerRadius = 8
        self.button.layer.cornerRadius = 7

        self.textView.delegate = self
        
        
    }
    
    @IBAction func camera(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
        else{
            print("error")
            
        }
        
    }
    
    @IBAction func alubum(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
            
        }
            
        else{
        
            
        }
        
        
        
    }
    
  
    
//    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){

        if let pickedImage = info[.originalImage]
            as? UIImage {

            imageView.image = pickedImage

        }

        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)


    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        print("Canceled")
    }
    
 
    // 書き込み完了結果の受け取り
    @objc func image(_ image: UIImage,
                     didFinishSavingWithError error: NSError!,
                     contextInfo: UnsafeMutableRawPointer) {

        if error != nil {
            print(error.code)

        }
        else{

        }
    }
    
    
    
    @IBAction func save(_ sender: Any) {
        
        do {
            let realm = try Realm()
            
            let dog = Dog()
            
            myImage = imageView.image
            
            dog.name = "YU"
            dog.image = myImage
            dog.hitokoto = textView.text!
            
            try! realm.write {
                realm.add(dog)
                print("success", dog)
                
                
            }
            
        } catch {
            print("error")
        }
     
        
    self.navigationController?.popToRootViewController(animated: true)
        
        
    }
   
    
//    returnキーで閉じる
  
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if (text == "\n") {
           
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
