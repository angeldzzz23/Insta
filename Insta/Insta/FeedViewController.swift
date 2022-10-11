//
//  FeedViewController.swift
//  Insta
//
//  Created by Angel Zambrano on 10/10/22.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
//        let btn = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logOutButtonWasPressed))
//
//          let backButton: UIBarButtonItem = btn
//              self.navigationItem.leftBarButtonItem = backButton
          
        
        let instBtn = UIBarButtonItem(image: UIImage(named: "insta_camera_btn"), style: .done, target: self, action: .some(#selector(cameraButtonWasPressed)) )
        let rightButton: UIBarButtonItem = instBtn
        self.navigationItem.rightBarButtonItem = rightButton
        
        
//          let tweetBtn = UIBarButtonItem(title: "tweet", style: .plain, target: self, action: #selector(tweetButtonWasPressed))
//          let rightButton: UIBarButtonItem = tweetBtn
//          self.navigationItem.rightBarButtonItem = rightButton
        
        // Do any additional setup after loading the view.
    }
    
    @objc func cameraButtonWasPressed() {

        let vc = CameraViewController()
        vc.modalPresentationStyle = .fullScreen
        
        navigationController?.present(vc, animated: true)
//        navigationController?.showDetailViewController(Came, sender: <#T##Any?#>)
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
