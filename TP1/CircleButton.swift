//
//  CircleButton.swift
//  TP1
//
//  Created by Mamitiana RAKOTO on 19/03/2021.
//

import Foundation
import UIKit

class CircleButton: UIButton {
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.layer.cornerRadius = self.frame.height/2
		// self.layer.backgroundColor = CGColor.init(red: 190, green: 190, blue: 190, alpha: 1)
	}
}
