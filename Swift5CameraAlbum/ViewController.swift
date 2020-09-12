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
        
        
    }
    
}

