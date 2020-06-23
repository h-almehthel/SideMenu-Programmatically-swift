//
//  ViewController.swift
//  SideMenuProgrammatically
//
//  Created by AlHassan Al-Mehthel on 11/07/1441 AH.
//  Copyright © 1441 AlHassan Al-Mehthel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var leftBarButtonItem = UIBarButtonItem()
    var mainViewXConstraint : NSLayoutConstraint!
    var sideMenuWidth = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isMenuShow = false
        mainViewXConstraint.constant = 0
        leftBarButtonItem.tintColor = .purple
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    var isMenuShow = false
    
    @objc func menuTapped() {
        
        if isMenuShow {
            mainViewXConstraint.constant = 0
            leftBarButtonItem.tintColor = .purple
        } else {
            mainViewXConstraint.constant = sideMenuWidth
            leftBarButtonItem.tintColor = .white
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        isMenuShow.toggle()
    }

    
    let mainView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .init(white: 0.95, alpha: 1)
        $0.layer.zPosition = 100
        return $0
    }(UIView())
    
    let iconImage : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.image = #imageLiteral(resourceName: "Motion")
        $0.tintColor = .lightGray
        $0.clipsToBounds = true
        return $0
    }(UIImageView())

    
    let sideMenu : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.cyan.withAlphaComponent(0.30)
        return $0
    }(UIView())
    
    let separatorView : UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.purple.withAlphaComponent(0.20)
        return $0
    }(UIView())
    
    
    let titleLable : UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont(name: "Futura", size: 30)
        $0.textColor = UIColor.black.withAlphaComponent(0.70)
        $0.text = "Side Menu \n \n Without Storyboard"
        $0.textAlignment = .center
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let sideMenuStackView : UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView())
    
    lazy var openGreenVC : UIButton = {
        $0.setTitle("Green", for: .normal)
        $0.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        $0.titleLabel?.font = UIFont(name: "Futura", size: 20)
        $0.tintColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        $0.tag = 10
        $0.addTarget(self, action: #selector(menuButtonsActions(_:)), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    lazy var openOrangeVC : UIButton = {
        $0.setTitle("Orange", for: .normal)
        $0.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        $0.titleLabel?.font = UIFont(name: "Futura", size: 20)
        $0.tintColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        $0.tag = 11
        $0.addTarget(self, action: #selector(menuButtonsActions(_:)), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    lazy var openPinkVC : UIButton = {
        $0.setTitle("Pink", for: .normal)
        $0.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        $0.titleLabel?.font = UIFont(name: "Futura", size: 20)
        $0.tintColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        $0.tag = 12
        $0.addTarget(self, action: #selector(menuButtonsActions(_:)), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    

    
    @objc func menuButtonsActions(_ sender : UIButton) {
        if sender.tag == 10 {
            navigationController?.pushViewController(GreenVC(), animated: true)
        }
        else if sender.tag == 11 {
            navigationController?.pushViewController(OrangeVC(), animated: true)
        }
        else {
            let vc = PinkVC()
            self.present(vc, animated: true, completion: nil)
        }
 
        mainViewXConstraint.constant = 0
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        isMenuShow = false
        
        leftBarButtonItem.tintColor = .purple
    }
    
    
    
}

extension ViewController {
    
    func setupUI() {
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.barTintColor = .white
        
        
        sideMenuWidth = view.frame.width / 3
        
        view.addSubview(mainView)
        view.addSubview(sideMenu)
        mainView.addSubview(iconImage)
        sideMenu.addSubview(separatorView)
        mainView.addSubview(titleLable)
        sideMenu.addSubview(sideMenuStackView)
        sideMenuStackView.addArrangedSubview(openGreenVC)
        sideMenuStackView.addArrangedSubview(openOrangeVC)
        sideMenuStackView.addArrangedSubview(openPinkVC)
        
        leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Menu"), style: .plain, target: self, action: #selector(menuTapped))
        leftBarButtonItem.tintColor = .purple
        navigationItem.leftBarButtonItem = leftBarButtonItem
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        NSLayoutConstraint.activate([
        
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainView.heightAnchor.constraint(equalTo: view.heightAnchor),
            mainView.widthAnchor.constraint(equalTo: view.widthAnchor),

            iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            iconImage.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            iconImage.heightAnchor.constraint(equalToConstant: 130),
            iconImage.widthAnchor.constraint(equalToConstant: 130),
            
            titleLable.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            titleLable.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            titleLable.widthAnchor.constraint(equalTo: mainView.widthAnchor, constant: -50),
            
            sideMenu.heightAnchor.constraint(equalTo: mainView.heightAnchor),
            sideMenu.widthAnchor.constraint(equalTo: view.widthAnchor),
            sideMenu.rightAnchor.constraint(equalTo: mainView.leftAnchor),
            sideMenu.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            
            separatorView.heightAnchor.constraint(equalTo: sideMenu.heightAnchor),
            separatorView.widthAnchor.constraint(equalToConstant: 3),
            separatorView.rightAnchor.constraint(equalTo: sideMenu.rightAnchor),
            separatorView.centerYAnchor.constraint(equalTo: sideMenu.centerYAnchor),
            
            sideMenuStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            sideMenuStackView.rightAnchor.constraint(equalTo: separatorView.leftAnchor),
            sideMenuStackView.widthAnchor.constraint(equalToConstant: sideMenuWidth),
            openGreenVC.heightAnchor.constraint(equalToConstant: 50),
            
            
        ])
        
        mainViewXConstraint = mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        mainViewXConstraint.isActive = true
    }
    
}
