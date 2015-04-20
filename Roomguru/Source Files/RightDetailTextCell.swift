//
//  RightDetailTextCell.swift
//  Roomguru
//
//  Created by Radoslaw Szeja on 19/04/15.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

import UIKit
import Cartography

class RightDetailTextCell: TableViewCell {
    
    override class var reuseIdentifier: String {
        get { return "TableViewRightDetailTextCellReuseIdentifier" }
    }
    
    let detailLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        detailLabel.textAlignment = .Right
        addSubview(detailLabel)
        defineConstraints()
    }
    
    private func defineConstraints() {
        
        layout(detailLabel) { detail in
            detail.right == detail.superview!.right - 35
            detail.width == CGRectGetWidth(self.frame) * 0.6
            detail.centerY == detail.superview!.centerY
        }
    }
}