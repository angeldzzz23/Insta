//
//  FeedViewController.swift
//  Insta
//
//  Created by Angel Zambrano on 10/10/22.
//

import UIKit
import Parse
import AlamofireImage

class FeedViewController: UIViewController {

    
    let feedTableView: UITableView = {
        let tb  = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(PostCellTableViewCell.self, forCellReuseIdentifier: PostCellTableViewCell.identifier)
        return tb
    }()
    
    
    
    
    var posts = [PFObject]()
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { posts, error in
            if posts != nil {
                self.posts = posts!
                self.feedTableView.reloadData()
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let instBtn = UIBarButtonItem(image: UIImage(named: "insta_camera_btn"), style: .done, target: self, action: .some(#selector(cameraButtonWasPressed)) )
        let rightButton: UIBarButtonItem = instBtn
        self.navigationItem.rightBarButtonItem = rightButton
        
        //
        let lbutton = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(doneButtonWasPressed))
        let leftButton: UIBarButtonItem = lbutton
        self.navigationItem.leftBarButtonItem = leftButton
        
        addSubviews()
        setConstraints()
        
    }
    
    @objc func cameraButtonWasPressed() {

        let vc = CameraViewController()
        vc.modalPresentationStyle = .fullScreen
        
        navigationController?.present(vc, animated: true)
        
    }
    
    @objc func doneButtonWasPressed() {
        PFUser.logOut()
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let delegate = windowScene.delegate as? SceneDelegate else {return}
        
        let loginVC = ViewController()
        delegate.window?.rootViewController = loginVC
    }
    
   
    private func addSubviews() {
        feedTableView.dataSource = self
        feedTableView.delegate = self
        
        view.addSubview(feedTableView)
        
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            feedTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            feedTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }

}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCellTableViewCell.identifier, for: indexPath) as! PostCellTableViewCell
        
        let post = posts[indexPath.row]
        let user = post["author"] as! PFUser
        cell.lblName.text = user.username
        cell.postCaptionLbl.text = post["caption"] as! String
        
        let imageFile = post["image"] as! PFFileObject
        let urlStrinh = imageFile.url!
        let url = URL(string: urlStrinh)!
        
        cell.postImage.af.setImage(withURL: url)
        
        return cell
    }

}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
