//
//  ViewController.swift
//  TechPod
//
//  Created by kawagishi on 2018/02/13.
//  Copyright © 2018年 juna Kawagishi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //----------------------------------------
    //Setting variable
    //----------------------------------------
    @IBOutlet var table: UITableView!
    var songNameArray = [String]()
    var fileNameArray = [String]()
    var imageNameArray = [String]()
    
    var audioPlayer: AVAudioPlayer!
    
    //----------------------------------------
    //Setting function
    //----------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //テーブルビューのデータソースメソッドはViewControllerクラスに書くという設定
        table.dataSource = self
        
        //テーブルビューのデリゲートメソッドはViewControllerクラスに書くという設定
        table.delegate = self
        
        songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
        fileNameArray = ["cannon","elise","aria"]
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //----------------------------------------
    //original function
    //----------------------------------------
    
    //Cell numbers
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    //ID付きのセルの取得＆テストの表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = songNameArray[indexPath.row]
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
    }
    
    //method of pushing Cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("\(songNameArray[indexPath.row])が選ばれました")
        
        let audioPath = Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType:"mp3")!
        let audioURL = URL(fileURLWithPath: audioPath)
        
        audioPlayer = try? AVAudioPlayer(contentsOf: audioURL)
        audioPlayer.play()
    }

}

