//
//  ViewController.swift
//  Traffic Lights
//
//  Created by Mitchell Hamilton on 7/6/19.
//  Copyright © 2019 Mitchell Hamilton. All rights reserved.

//BUILD REASONING

// I didn't like the look of GUI with the recommended single button string operator, so I decided to use pageControl and scollView with 4 images that I created to represent the traffic lights. I like this design far better, even though it strays from the brief somewhat.



import UIKit

//VIEW CONTROLLER (source: https://developer.apple.com/documentation/uikit/uiviewcontroller and https://developer.apple.com/documentation/uikit/uiscrollview)
class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
//STRING OF FOUR IMAGES
    var images: [String] = ["1", "2", "3", "4"]
    var frame =  CGRect(x:0, y:0, width:0, height:0)

//FUNCTION TO LOAD IMAGES
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count
        for index in 0..<images.count {
            frame.origin.x = scrollView.frame.size.width
            * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame:frame)
            imgView.image = UIImage(named:images[index])
            self.scrollView.addSubview(imgView)
            
// SET UP CONTENT SIZE OF SCROLL VIEW
            scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height: scrollView.frame.size.height)
            
// SET SCROLL VIEW DELEGATE (source: https://developer.apple.com/documentation/uikit/uiscrollviewdelegate)
            scrollView.delegate = self
        }
        
// SET SCROLL VIEW METHOD
        func scrollViewDidEndDecelerating(_scrollView: UIScrollView){
            var pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
            pageControl.currentPage = Int(pageNumber)
        }
        
    }


}

