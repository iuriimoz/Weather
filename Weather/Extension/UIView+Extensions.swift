//
//  UIView+Extensions.swift
//  Weather
//
//  Created by Iurii Mozharovskyi on 2/23/17.
//  Copyright © 2017 DeftApps. All rights reserved.
//

import UIKit


extension UIView {
    class func fromNib<T : UIView>(bundle: Bundle = Bundle.main) -> T? {
        let nibName = String(describing: T.self)
        
        let views = bundle.loadNibNamed(nibName,
                                        owner: nil,
                                        options: nil)
        
        return views?.first as? T
    }
}
