//
//  FeedViewController.swift
//  Insta
//
//  Created by Angel Zambrano on 10/10/22.
//

import UIKit

class FeedViewController: UIViewController {

    
    let feedTableView: UITableView = {
        let tb  = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(PostCellTableViewCell.self, forCellReuseIdentifier: PostCellTableViewCell.identifier)
        return tb
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    
        let instBtn = UIBarButtonItem(image: UIImage(named: "insta_camera_btn"), style: .done, target: self, action: .some(#selector(cameraButtonWasPressed)) )
        let rightButton: UIBarButtonItem = instBtn
        self.navigationItem.rightBarButtonItem = rightButton
        
        
        addSubviews()
        setConstraints()
        
    }
    
    @objc func cameraButtonWasPressed() {

        let vc = CameraViewController()
        vc.modalPresentationStyle = .fullScreen
        
        navigationController?.present(vc, animated: true)
        
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCellTableViewCell.identifier, for: indexPath) as! PostCellTableViewCell
        
        return cell
    }

}

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}
