//
//  TableViewChat.swift
//  TableViewChat
//
//  Created by Ivan Ivanov on 3/4/21.
//

import UIKit

class TableViewChat: UITableViewController {
    var newMessages = [[Message]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        attemptToAssambleGroupMessage()
        navigationItem.title = "Messages"
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        
        
    }
    
    fileprivate func attemptToAssambleGroupMessage(){
      let gruptedMessages  = Dictionary(grouping: Messages.fetchData()) { (el) -> Date in
        return el.date
        }
        
        gruptedMessages.keys.sorted().forEach { (key) in
            newMessages.append(gruptedMessages[key] ?? [])
        }
    }
    class DateHeaderLabel: UILabel {
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = #colorLiteral(red: 0.4077384472, green: 0.8012858033, blue: 0.2202140093, alpha: 1)
            font = UIFont.boldSystemFont(ofSize: 14)
            textAlignment = .center
            textColor = .black
            translatesAutoresizingMaskIntoConstraints = false
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize {
            let originalSize = super.intrinsicContentSize
            let height = originalSize.height + 16
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalSize.width + 12, height: height)
        }
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return newMessages.count
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstItemInSection = newMessages[section].first {
            let formattedDate = DateFormatter()
            formattedDate.dateFormat = "MM/dd/yyyy"
            let dateString = formattedDate.string(from: firstItemInSection.date)
            let label = DateHeaderLabel()
            label.text = dateString

            let labelView = UIView()
       
            labelView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: labelView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: labelView.centerYAnchor).isActive = true
            return labelView
        }
        return nil
    }

    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newMessages[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.newMesseage = newMessages[indexPath.section][indexPath.row]
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("click")
    }
}
