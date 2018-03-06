//
//  ViewController.swift
//  HorizontalScrollView
//
//  Created by Shaw on 27/02/2018.
//  Copyright © 2018 JdHealth. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var contentWidth : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        pageControl.numberOfPages = 4
        for index in 0...3   {
            let image = UIImage(named: "\(index).png")
            let imageView = UIImageView(image:image)
            
            contentWidth += view.frame.width
            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(index)
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: xCoordinate - 50, y: view.frame.height/2 - 50, width: 100, height: 100)
        }
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
        
    }

  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(Int(scrollView.contentOffset.x/view.frame.width))

        pageControl.currentPage = Int(scrollView.contentOffset.x/view.frame.width)
    }


}

