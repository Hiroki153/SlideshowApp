//
//  ImageZoomUpViewController.swift
//  Slideshowapp
//
//  Created by 仲井宏紀 on 2020/09/20.
//  Copyright © 2020 hiroki.nakai. All rights reserved.
//

import UIKit

class ImageZoomUpViewController: UIViewController {

    //拡大画像を表示するimageViewを配置
       
       @IBOutlet weak var zoomUpImageView: UIImageView!
       //受け取りためのプロパティを宣言する
    
    
    var selectedImg: UIImage!
       
       override func viewDidLoad() {
           super.viewDidLoad()
        
        
           


           // Do any additional setup after loading the view.≈
           //Image Viewに読み込んだ画像をセット
           zoomUpImageView.image = selectedImg
                   //画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
           zoomUpImageView.contentMode = UIView.ContentMode.scaleAspectFit
           
       }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
