//
//  FifthViewController.swift
//  PagesOfPain
//
//  Created by Nicholas Repaci on 9/28/20.
//

//import AVFoundation
//import AVKit
import UIKit
//var player: AVPlayer!
import SwiftVideoBackground



class FifthViewController: UIViewController {
    
    @IBOutlet weak var talkingLabel: UILabel!
    
    let emitter = Emitter()
    
    var displayTalkingText = 0
    
    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var forestImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emitter.particleEmitter(view: view, fileName: "ForestSmokeParticle", xval: 250, yval: 50)
        
        bringForestToFront()
        bringButtonToFront()
        
        displayTextToUser()
        
        
        
        //loadVideoBackground()
        //setupView()
    }
    
    
    func loadVideoBackground() {
        try? VideoBackground.shared.play(view: view, videoName: "RedBuilding", videoType: "mov")
    }
  
    
    @IBAction func beginButton(_ sender: UIButton) {
        performSegue(withIdentifier: "playButtonSegue", sender: self)
    }
    
    func bringButtonToFront() {
        self.view.bringSubviewToFront(self.beginButton)
        beginButton.layer.zPosition = 5
        

    }
    
    func bringForestToFront() {
        self.view.bringSubviewToFront(self.forestImage)
        
        //brings forest image in front of emitter
        forestImage.layer.zPosition = 3
    }
    
    func displayTextToUser() {
        if displayTalkingText == 1 {
            animateLabel(text: "Huh, so turing it to the right gets you stuck as me. Turning it left just brings you back to the start screen. Very cool.")
        }
    }
    
    func animateLabel(text: String) {
        
        talkingLabel.text = ""
            let titleText = text
            var charIndex = 0.0
            for letter in titleText {
                Timer.scheduledTimer(withTimeInterval: 0.04 * charIndex, repeats: false) { (timer) in
                    self.talkingLabel.text?.append(letter)
                }
                 charIndex += 1
        
            }
        //talkingLabel.layer.zPosition = 1
    }
    
}
    
//    private func playBackgoundVideo() {
//        if let filePath = Bundle.main.path(forResource: "your_video_here", ofType:"mp4") {
//            let filePathUrl = NSURL.fileURL(withPath: filePath)
//            player = AVPlayer(url: filePathUrl)
//            let playerLayer = AVPlayerLayer(player: player)
//            playerLayer.frame = self.videoPlayer.bounds
//            playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
//            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: nil) { (_) in
//                self.player?.seek(to: kCMTimeZero)
//                self.player?.play()
//            }
//            self.videoView.layer.addSublayer(playerLayer)
//            player?.play()
//        }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "RedBuilding", ofType: "mov")!))
//        let layer = AVPlayerLayer(player: player)
//        layer.frame = view.bounds
//        layer.videoGravity = .resizeAspectFill
//        view.layer.addSublayer(layer)
//        player.volume = 0
//        player.play()
//    }
    
    
//    func setupView() {
//        guard let path = Bundle.main.path(forResource: "RedBuilding", ofType: "mp4") else {
//            return
//        }
//
//        player = AVPlayer(url: URL(fileURLWithPath: path))
//
//        let newLayer = AVPlayerLayer(player: player)
//        newLayer.frame = self.view.bounds
//        newLayer.videoGravity = .resizeAspectFill
//        self.videoView.layer.addSublayer(newLayer)
//
//        player.play()
//
//
//    }
    
    

