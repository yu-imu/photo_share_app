//
//  ViewController.swift
//  cameraApp
//
//  Created by imua yusei on 2018/03/02.
//  Copyright © 2018年 imua yusei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var photoImage: UIImageView!
    
    @IBAction func cameraLaunchAction(_ sender: Any) {
        // カメラ機動を確認する
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camrea can be used.")
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            // イメージピッカーを表示
            present(ipc,animated: true, completion: nil)
        } else {
            print("Camera is not available.")
        }
    }
    @IBAction func shareAction(_ sender: Any) {
        if let shareImage = photoImage.image {
            let shareImages = [shareImage]
            let controller = UIActivityViewController(activityItems: shareImages, applicationActivities: nil)
            // ipadの表示対策
            controller.popoverPresentationController?.sourceView = view
            // 表示するやつ！
            present(controller, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        photoImage.image = info["UIImagePickerControllerOriginalImage"] as? UIImage
        dismiss(animated: true, completion: nil)
    }

}

