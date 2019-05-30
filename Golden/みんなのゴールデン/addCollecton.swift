//
//  addCollecton.swift
//  Pods-Golden
//
//  Created by 笹倉一也 on 2019/05/29.
//

import UIKit
import RealmSwift

class addCollecton: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var myImage:UIImage? = nil
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.imageView.layer.cornerRadius = 8
        self.button.layer.cornerRadius = 7

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
            
            dog.image = myImage
            
            dog.hitokoto = textView.text!
            
            try! realm.write {
                realm.add(dog)
                print("success", dog)
                
                
            }
            
        } catch {
            print("error")
        }
        
    }
   
    
    
    
}
