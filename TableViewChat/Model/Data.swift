//
//  Data.swift
//  TableViewChat
//
//  Created by Ivan Ivanov on 3/4/21.
//

import UIKit

struct Messages {
    static func fetchData() -> [Message] {
        let messegae1 = Message(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", selfSender: true, date:Date.dateFormatCustomString(customString: "10/12/1992"))
        let message2 = Message(text: "when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.", selfSender: true, date: Date.dateFormatCustomString(customString: "10/12/1992"))
        let message3 = Message(text: " It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.", selfSender: false, date: Date.dateFormatCustomString(customString: "12/06/1992"))
        let message4 = Message(text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).", selfSender: true, date: Date.dateFormatCustomString(customString:"06/03/2020"))
        let message5 = Message(text: "Where does it come from?", selfSender: false, date: Date.dateFormatCustomString(customString: "11/31/2021"))
        
        return[messegae1,message2,message3,message4,message5]
    }
}
