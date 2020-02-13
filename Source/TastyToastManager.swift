//
//  makeToast.swift
//  TastyToaster
//
//  Created by Nishit Patel on 13/02/20.
//  Copyright © 2020 Nishit Patel. All rights reserved.
//

import Foundation
import UIKit



public class TastyToastManager{
    
    
    public init(){}
    private static func getWidth(width : CGFloat) -> CGFloat
    {
        var current_Size : CGFloat = 0.0
        current_Size = (UIScreen.main.bounds.width/320)
        let FinalWidth : CGFloat = width * current_Size
        return FinalWidth
    }
    private static func getHeight(height : CGFloat) -> CGFloat
    {
        var current_Size : CGFloat = 0.0
        current_Size = (UIScreen.main.bounds.height/568)
        let FinalHight : CGFloat = height * current_Size
        return FinalHight
    }
    private static func dynamicFontSizeForIphone(fontSize : CGFloat) -> CGFloat
    {
        var current_Size : CGFloat = 0.0
        current_Size = (UIScreen.main.bounds.width/320)
        let FinalSize : CGFloat = fontSize * current_Size
        return FinalSize
    }
    
    private static var screensize: CGRect = UIScreen.main.bounds
    
    
    public static func makeToast(message:String){
        
        let toastView = UIView(frame: CGRect(x: getWidth(width: 20.0), y: screensize.height - getWidth(width: 60.0), width: (screensize.width - (getWidth(width: 20.0) * 2)), height: getWidth(width: 40.0)))
        let toastTitle = UILabel(frame: CGRect(x: getWidth(width: 10.0), y: 0.0, width: (toastView.frame.size.width - (getWidth(width: 10.0) * 2)), height: getWidth(width: 40.0)))
        
        toastView.addSubview(toastTitle)
        toastView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        toastView.layer.cornerRadius = getWidth(width: 5.0)
        toastTitle.backgroundColor = .clear
        toastTitle.textColor = UIColor.white
        toastTitle.textAlignment = .left
        toastTitle.font = UIFont(name:"MaisonNeue-Bold", size:dynamicFontSizeForIphone(fontSize : 12.0))
        toastView.layer.masksToBounds = true
        toastTitle.text = message
        toastTitle.numberOfLines = 0
        toastTitle.alpha = 0

        let window = UIApplication.shared.delegate?.window!
        window?.addSubview(toastView)
        

        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
           
                toastView.alpha = 1
                toastTitle.alpha = 1
           
        }, completion: nil)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double((Int64)(1 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {

                toastView.alpha = 0
                toastTitle.alpha = 0
            }, completion: { finished in
                
                toastView.removeFromSuperview()
            })
        })
        
    }
    
    
    
    
    
}
