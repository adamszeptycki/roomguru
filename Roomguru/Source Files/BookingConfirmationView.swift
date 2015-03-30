//
//  BookingConfirmationView.swift
//  Roomguru
//
//  Created by Radoslaw Szeja on 27/03/15.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

import UIKit
import Cartography

class BookingConfirmationView: UIView {

    var minutesToBookLabel: UILabel = UILabel(frame: CGRectMake(0, 0, 70, 50))
    
    var confirmButton: UIButton = UIButton(frame: CGRectMake(0, 0, 100, 50))
    var cancelButton: UIButton = UIButton(frame: CGRectMake(0, 0, 100, 50))
    
    var lessMinutesButton: UIButton = UIButton(frame: CGRectMake(0, 0, 100, 50))
    var moreMinutesButton: UIButton = UIButton(frame: CGRectMake(0, 0, 100, 50))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: Private
    
    private var minutesShortLabel: UILabel = UILabel(frame: CGRectMake(0, 0, 200, 40))
    
    private func commonInit() {
        self.backgroundColor = UIColor.whiteColor()
        
        configureButtonsAppearance()
        configureLabelsAppearance()
        
        addSubview(confirmButton)
        addSubview(cancelButton)
        addSubview(lessMinutesButton)
        addSubview(moreMinutesButton)
    
        addSubview(minutesToBookLabel)
        addSubview(minutesShortLabel)
        
        defineConstraints()
    }
    
    private func defineConstraints() {
        
        layout(confirmButton, cancelButton) { (confirm, cancel) in
            confirm.left == confirm.superview!.left + 20
            confirm.bottom == confirm.superview!.bottom - 20
            
            cancel.right == confirm.superview!.right - 20
            cancel.bottom == confirm.superview!.bottom - 20
            
            confirm.right == cancel.left - 20
            
            confirm.height == 50
            confirm.width == cancel.width
            cancel.height == confirm.height
        }
        
        layout(minutesToBookLabel, minutesShortLabel) { (book, short) in
            book.center == book.superview!.center
            book.width == 70
            book.height == 50
            
            short.width == book.width
            short.centerX == book.centerX
            short.top == book.bottom
        }
        
        layout(lessMinutesButton, minutesToBookLabel) { (button, book) in
            button.width == 44
            button.height == 44
            button.centerY == button.superview!.centerY
            button.right == book.left
        }
        
        layout(moreMinutesButton, minutesToBookLabel) { (button, book) in
            button.width == 44
            button.height == 44
            button.centerY == button.superview!.centerY
            button.left == book.right
        }
        
    }
    
    private func configureButtonsAppearance() {
        let black = UIColor.blackColor()
        let highlighted = UIColor.lightGrayColor()
        
        self.lessMinutesButton.setTitle(NSLocalizedString("<", comment: ""), forState: .Normal)
        self.lessMinutesButton.setTitleColor(black, forState: .Normal)
        self.lessMinutesButton.setTitleColor(highlighted, forState: .Highlighted)
        self.lessMinutesButton.setTitleColor(highlighted, forState: .Disabled)
        
        self.moreMinutesButton.setTitle(NSLocalizedString(">", comment: ""), forState: .Normal)
        self.moreMinutesButton.setTitleColor(black, forState: .Normal)
        self.moreMinutesButton.setTitleColor(highlighted, forState: .Highlighted)
        self.moreMinutesButton.setTitleColor(highlighted, forState: .Disabled)
        
        self.confirmButton.setTitle(NSLocalizedString("Book", comment: ""), forState: .Normal)
        self.confirmButton.backgroundColor = UIColor.ngOrangeColor()
        self.confirmButton.layer.cornerRadius = 5.0
        
        self.cancelButton.setTitle(NSLocalizedString("Cancel", comment: ""), forState: .Normal)
        self.cancelButton.backgroundColor = UIColor.ngRedColor()
        self.cancelButton.layer.cornerRadius = 5.0
    }
    
    private func configureLabelsAppearance() {
        self.minutesShortLabel.text = NSLocalizedString("minutes", comment: "")
        self.minutesShortLabel.numberOfLines = 1
        self.minutesShortLabel.adjustsFontSizeToFitWidth = true
        self.minutesShortLabel.textAlignment = .Center
        
        self.minutesToBookLabel.font = UIFont.boldSystemFontOfSize(28.0)
        self.minutesToBookLabel.textAlignment = .Center
    }
}