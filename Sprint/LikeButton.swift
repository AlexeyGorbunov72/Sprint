//
//  LikeButton.swift
//  Sprint
//
//  Created by Alexey on 18.12.2020.
//

import UIKit

class LikeButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    func setup(){
        addTarget(self,action:#selector(buttonClicked),
                              for:.touchUpInside)
        setImage(UIImage(systemName: "heart"), for: .normal)
        tintColor = .systemPink
    
    }
    @objc func buttonClicked(sender:UIButton){
        print("iam working blya")
    }
}
