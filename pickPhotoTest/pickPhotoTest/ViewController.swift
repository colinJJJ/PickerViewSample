//
//  ViewController.swift
//  pickPhotoTest
//
//  Created by ColinJ on 16/10/13.
//  Copyright © 2016年 ColinJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {

//    定义一个全局的UIImagePickerController
    let imagePickerController: UIImagePickerController = UIImagePickerController()
//    展示图片的imageView
    @IBOutlet weak var photoView: UIImageView!
//    选取图片按钮方法的实现
    @IBAction func pickPhoto(_ sender: UIButton) {
        // 设置代理
        self.imagePickerController.delegate = self
        // 设置是否可以管理已经存在的图片或者视频
        self.imagePickerController.allowsEditing = true
//        弹出相册按钮的实现
        let photoAction:UIAlertAction = UIAlertAction(title: "相册", style: UIAlertActionStyle.default) { (UIAlertAction) in
            print("打开相册")
            // 设置类型
             self.imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
             self.present(self.imagePickerController, animated: true, completion: nil)
        }
//        取消按钮的实现
        let cancelAction:UIAlertAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel) { (UIAlertAction) in
            print("取消")
        }
        let alertController:UIAlertController = UIAlertController()
        alertController.addAction(photoAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true) { 
            print("模态出之后的回调")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let gotimage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoView.image = gotimage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

