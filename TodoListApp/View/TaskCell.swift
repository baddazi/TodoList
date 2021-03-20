//
//  TaskCell.swift
//  TODOListFirstApp
//
//  Created by David Záruba on 16.03.2021.
//

import Foundation
import SwiftUI

struct TaskCell: View { // (5)
  var task: Task
    let attrRedStrikethroughStyle = [
               NSAttributedString.Key.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue)
           ]
   // lazy var label1
   
  var body: some View {
 
    HStack {
       // self.attributeString =  NSMutableAttributedString(string: self.task.title)
        //self.attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
        let text = NSAttributedString(string: task.title,
                                                  attributes: attrRedStrikethroughStyle)
       // label1.attributedText = text
    }
  }
}
