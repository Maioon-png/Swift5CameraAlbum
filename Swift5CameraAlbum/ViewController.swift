//
//  ViewController.swift
//  Swift5CameraAlbum
//
//  Created by 岩崎舞 on 2020/09/12.
//  Copyright © 2020 岩崎舞. All rights reserved.
//

import UIKit
//カメラを使ってもいいかユーザーに確認
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var backImageView: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        PHPhotoLibrary.requestAuthorization { (status) in
            switch(status){
                
                
            case .notDetermined:
                print("notDetermined")
            case .restricted:
                print("restricted")
            case .denied:
                print("許可されていません。")
            case .authorized:
                print("許可されています。")
            }
        }
        
    }
    //カメラボタン
    @IBAction func openCamera(_ sender: Any) {
        let sourceType = UIImagePickerController.SourceType.camera
        //カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            //変数化
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            //編集を許す
            cameraPicker.allowsEditing = true
            present(cameraPicker, animated: true, completion: nil)
            
        }else{
            print("エラー")
        }
        
    }
    
    //カメラキャンセル
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Pickerが閉じる
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    //アルバムボタン
    @IBAction func openAlbum(_ sender: Any) {
        let sourceType = UIImagePickerController.SourceType.photoLibrary
        //カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            //変数化
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            //編集を許す
            cameraPicker.allowsEditing = true
            present(cameraPicker, animated: true, completion: nil)
            
        }else{
            print("エラー")
        }
    }
    
    //撮った写真、アルバムから選択した写真のでーたを受け取る
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //infoの中に画像が入っていたら
        if let pickedImage = info[.editedImage] as? UIImage{
            //UIImageViewに画像を差し込む
            backImageView.image = pickedImage
            //写真の保存
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, nil, nil)
        }
        //画面を閉じる
        picker.dismiss(animated: true, completion: nil)
        
    }
    //シェアするための機能
    @IBAction func share(_ sender: Any) {
        let text = "#test"
        let image = backImageView.image?.jpegData(compressionQuality: 0.2)
        let items = [text, image] as [Any]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
}


