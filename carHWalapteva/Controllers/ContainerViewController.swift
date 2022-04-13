//
//  ContainerViewController.swift
//  carHWalapteva
//
//  Created by Anastasiya Laptseva on 29.03.22.
//

import UIKit

class ContainerViewController: UIViewController, CarViewControllerDelegate {
    
    var carController: CarViewController!
    var menuViewController: UIViewController!
    var choiceCarMenuViewController: UIViewController!
    var isMove = false
    var isMoveCollection = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCarViewController()
    }
    
    func configureCarViewController() {
        view.backgroundColor = .white

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "carVC") as? CarViewController
        guard let controller = controller else { return }

        carController = controller
        carController.delegate = self
        view.addSubview(carController.view)
        addChild(carController)
    }
    
    func configureMenuViewController() {
        if menuViewController == nil {
            menuViewController = MenuViewController()
            choiceCarMenuViewController?.view.removeFromSuperview()
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            print("добавиль mainviewcontroller")
        }
    }
    func configureChoiceCarMenuViewController() {
        if choiceCarMenuViewController == nil {
            choiceCarMenuViewController = RecordsCollectionViewController()
            menuViewController?.view.removeFromSuperview()
            view.insertSubview(choiceCarMenuViewController.view, at: 0)
            addChild(choiceCarMenuViewController)
            print("добавил mainviewcontroller")
        }
    }
    func showMenuViewController(shouldMove: Bool) {
        if shouldMove {
            //показываем меню
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.carController.view.frame.origin.x = self.carController.view.frame.width - 140
            } completion: { (finished) in
            }
        } else {
            //скрываем меню
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.carController.view.frame.origin.x = 0
            } completion: { (finished) in
            }
        }
    }
    func showCollectionCarViewController(shouldMove: Bool) {
        if shouldMove {
            //показываем меню
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.carController.view.frame.origin.x =  -self.carController.view.frame.width + 140
            } completion: { (finished) in
            }
        } else {
            //скрываем меню
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut) {
                self.carController.view.frame.origin.x = 0
            } completion: { (finished) in
            }
        }
    }
    
//    MARK: CarViewControllerDelegate
    func toggleMenu() {
        configureMenuViewController()
        isMove = !isMove
        showMenuViewController(shouldMove: isMove)
    }
    
    func collectionMenu() {
        configureChoiceCarMenuViewController()
        isMoveCollection = !isMoveCollection
        showCollectionCarViewController(shouldMove: isMoveCollection)
    }
}
