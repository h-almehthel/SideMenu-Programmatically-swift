//
//  BlueVC.swift
//  SideMenuProgrammatically
//
//  Created by AlHassan Al-Mehthel on 11/07/1441 AH.
//  Copyright © 1441 AlHassan Al-Mehthel. All rights reserved.
//

import UIKit

class PinkVC : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .init(white: 0.95, alpha: 1)
        
        view.addSubview(titleLable)
        view.addSubview(image)
        
        NSLayoutConstraint.activate([
        
            titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            image.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        
        ])
        
        self.navigationController?.navigationBar.tintColor = .purple
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
    }

    let titleLable : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Pink Color"
        $0.font = UIFont(name: "Futura", size: 40)
        $0.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        $0.textAlignment = .center
        return $0
    }(UILabel())

    let image : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.image = #imageLiteral(resourceName: "Blue")
        $0.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        return $0
    }(UIImageView())

}
