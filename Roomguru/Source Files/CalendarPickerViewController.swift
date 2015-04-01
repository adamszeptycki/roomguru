//
//  CalendarPickerViewController.swift
//  Roomguru
//
//  Created by Patryk Kaczmarek on 01/04/15.
//  Copyright (c) 2015 Netguru Sp. z o.o. All rights reserved.
//

import UIKit

class CalendarPickerViewController: UIViewController {
        
    weak var aView: CalendarPickerView?
    
    // MARK: View life cycle

    
    override func loadView() {
        aView = loadViewWithClass(CalendarPickerView.self) as? CalendarPickerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Pick your calendars", comment: "")
    }
}
