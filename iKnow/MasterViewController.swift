//
//  MasterViewController.swift
//  iKnow
//
//  Created by Shao-Wei Liang on 2018-01-28.
//  Copyright © 2018 Shao-Wei Liang. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupSegmentedControl()
        updateView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupSegmentedControl() {
        // Configure Segmented Control
        segmentedControl.removeAllSegments()
        segmentedControl.insertSegment(withTitle: "Camera", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Photo", at: 1, animated: false)

        // Select First Segment
        segmentedControl.selectedSegmentIndex = 0
        self.view.addSubview(settingsBtn)
    }

    private lazy var cameraViewController: CameraViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
        
//        // Add View Controller as Child View Controller
//        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var photoViewController: PhotoViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "PhotoViewController") as! PhotoViewController
        
//        // Add View Controller as Child View Controller
//        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
        
    }
    
    @IBAction func layerChanged(_ sender: UISegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
        updateView()
    }
    
    //Remove all layers within the parent view controller
    private func removeAll(parentViewController parentView: UIViewController){
        if parentView.childViewControllers.count > 0{
            let viewControllers:[UIViewController] = parentView.childViewControllers
            for viewContoller in viewControllers{
                viewContoller.willMove(toParentViewController: nil)
                viewContoller.view.removeFromSuperview()
                viewContoller.removeFromParentViewController()
            }
        }
    }
    
    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
//            remove(asChildViewController: cameraViewController)

            removeAll(parentViewController: self)
            add(asChildViewController: cameraViewController)
        } else {
//            remove(asChildViewController: cameraViewController)
            removeAll(parentViewController: self)
            add(asChildViewController: photoViewController)
        }
        
        //Bring the buttons to the front layer everytime the mode(layer) changes
        self.view.bringSubview(toFront: segmentedControl)
        self.view.bringSubview(toFront: settingsBtn)
    }
    
}