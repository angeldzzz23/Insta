//
//  FeedViewController.swift
//  Insta
//
//  Created by Angel Zambrano on 10/10/22.
//

import UIKit
import Parse
import AlamofireImage
import MessageInputBar


class FeedViewController: UIViewController {


    let feedTableView: UITableView = {
        let tb  = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(PostCellTableViewCell.self, forCellReuseIdentifier: PostCellTableViewCell.identifier)
        tb.register(commentTableViewCell.self, forCellReuseIdentifier: commentTableViewCell.identifier)
        return tb
    }()
    let commentBar = MessageInputBar()
    
    var showsCommentBar = false
    
    
    override var inputAccessoryView: UIView? {
        return commentBar
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    




    var posts = [PFObject]()


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


        let query = PFQuery(className: "Posts")
        query.includeKeys(["author", "comments", "comments.author"])
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
        
        feedTableView.keyboardDismissMode = .interactive
        
        
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
    
    
   

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]

        let comment = PFObject(className: "Comments")
        comment["text"] = "This is a random comment"
        comment["post"] = post
        comment["author"] = PFUser.current()!

//        post.add(comment, forKey: "comments")
//        post.saveInBackground() { (success, error) in
//            if success {
//                print("comment saved")
//            } else {
//                print("errror saving comment")
//            }
//        }
    
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let post = posts[section]
        let comments = (post["comments"] as? [PFObject]) ?? []
        
        
        return comments.count + 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let post = posts[indexPath.section]
        
        let comments = (post["comments"] as? [PFObject]) ?? []
        
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostCellTableViewCell.identifier, for: indexPath) as! PostCellTableViewCell
            
            let user = post["author"] as! PFUser
            cell.lblName.text = user.username
            cell.postCaptionLbl.text = post["caption"] as! String

            let imageFile = post["image"] as! PFFileObject
            let urlStrinh = imageFile.url!
            let url = URL(string: urlStrinh)!

            cell.postImage.af.setImage(withURL: url)

            return cell

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: commentTableViewCell.identifier, for: indexPath) as! commentTableViewCell
            let comment = comments[indexPath.row - 1]
           let commentTxt = comment["text"] as? String
            let user = comment["author"] as? PFUser
            cell.usernamelbl.text = user?.username ?? ""
            cell.commentLbl.text = commentTxt
            
            
            

            return cell
        }
        
    }

}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 400
        } else {
            return 44
        }
    
    }
}
