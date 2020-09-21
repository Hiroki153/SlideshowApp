//
//  ViewController.swift
//  Slideshowapp
//
//  Created by 仲井宏紀 on 2020/09/12.
//  Copyright © 2020 hiroki.nakai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

  
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    var selectedImage: UIImage?
    
    
    //表示している画像の番号
       var dispImageNo = 0
    
    //画像の名前の配列
       let imageNameArray = [
                    "meat",
                    "sushi",
                    "noodle"
                ]
    //表示している画像の番号から名前を取り出し
          lazy var name = imageNameArray[dispImageNo]

       //表示している画像の番号を元に画像を表示する
    func displayImage(){
           
      
        
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        
        //表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
                
        //画像を読み込み
        let image = UIImage(named: name)

        //Image Viewに読み込んだ画像をセット
        imageView.image = image
        
    }
    
    //一定の間隔で処理を行うためのタイマー
    var timer : Timer?
    
    //タイマー用の時間のための変数
    var timer_sec: Int = 0
    
    @IBOutlet weak var imageBack: UIButton!
    
    @IBOutlet weak var imageForward: UIButton!
    
    @IBOutlet weak var slideShowStart: UIButton!
    
    
    @IBAction func imageBack(_ sender: Any) {
        //表示している画像の番号
           dispImageNo -= 1
        displayImage()
        
        if dispImageNo < 0 {
            //dispImageNoに最後の配列を代入して最後の画像に移る
            dispImageNo = 2
            displayImage()
        }
    }
    
    @IBAction func imageForward(_ sender: Any) {
       
        //表示している画像の番号を1増やす
        dispImageNo += 1
        //表示している画像の番号を元に画像を表示する
        displayImage()
        
        //nameに入っている配列がimageNameArrayの最後の配列の場合
        if dispImageNo > 2 {
                   //dispImageNoに0を代入して最初の画像に戻る
                dispImageNo = 0
                //表示している画像の番号を元に画像を表示する
                displayImage()
                   
     
        }
    }
    
   
    override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
        //初期状態は最初の画像を表示
        dispImageNo = 0
        //画像を表示
        displayImage()
        
        slideShowStart.setTitle("再生", for: .normal)
        
          //パターン２　UITapGestureRecognizerを使用する
            
            let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(
                target: self,
                action: #selector(ViewController.tapped(_:))
            )
        
        tapGesture.delegate = self
            
            self.view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func updateTimer(_ timer: Timer) {
        dispImageNo += 1
        displayImage()
    }
             
       
    
    @IBAction func slideShowStart(_ sender: Any) {
      
        //タイマーをセットして、2秒経過したら次の画像に送る
        if self.timer == nil {
            timer = Timer.scheduledTimer(timeInterval:2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            imageForward.isEnabled = false
            imageBack.isEnabled = false
            slideShowStart.setTitle("停止", for: .normal)
        }
        else{
                self.timer!.invalidate()
                self.timer = nil
            imageForward.isEnabled = true
            imageBack.isEnabled = true
            slideShowStart.setTitle("再生", for: .normal)
            }
    
    }

    
  
        
        //selectorでタップされたときに呼び出されるメソッドを登録
        
        @objc func tapped(_ sender: UITapGestureRecognizer){

            selectedImage = imageView.image
            
            //タップされたときのスライドショーの制御を行う
            if self.timer != nil {
                
                    self.timer!.invalidate()
                    self.timer = nil
                imageForward.isEnabled = true
                imageBack.isEnabled = true
                slideShowStart.setTitle("再生", for: .normal)
            }
            
            if selectedImage != nil {
                //imageZoomUpViewControllerへ遷移するためにSegueを呼び出す
                performSegue(withIdentifier: "toImageZoomUpViewController", sender: nil)
        }
    }
        //imagezoomupviewcontrollerへの遷移//
                  override func prepare(for segue: UIStoryboardSegue, sender: Any!){
                    if (segue.identifier == "toImageZoomUpViewController"){
                      //segueから遷移先のImageZoomUpViewControlerを取得する
                      let imageZUV = segue.destination as! ImageZoomUpViewController
                        
                      //遷移先のImageZoomUpViewControllerで宣言しているimageに値を代入して渡す
                      imageZUV.selectedImg = selectedImage
                    }
        
    }
}
            
        
    





