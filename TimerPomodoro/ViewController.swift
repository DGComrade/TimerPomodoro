//
//  ViewController.swift
//  TimerPomodoro
//
//  Created by Danil Goncharov on 17.10.2021.
//

import UIKit

class ViewController: UIViewController {
    

    // MARK: - Properties
    
    private var timerCounter = 0
    private var isWorkTimer = true
    private var isStarted = false
    
    //MARK: - Views
    
    private let timerLabel = UILabel()
    private let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupViews()
    }
    
    private func setupViews() {
        timerLabel.font = .systemFont(ofSize: Metric.fontSize)
        timerLabel.text = "\(timerCounter)"
        button.setImage(Icon.playIcon, for: .selected)
        button.setImage(Icon.pauseIcon, for: .normal)
    }
    
    private func setupHierarchy() {
        view.addSubview(timerLabel)
        view.addSubview(button)
    }
    
    private func setupLayout() {
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: Metric.buttonTopOffset).isActive = true
    }
    
    // MARK: - Constans
    
    enum Metric {
        static let fontSize: CGFloat = 34
        static let buttonTopOffset: CGFloat = 80
    }
    
    enum Icon {
        static let playIcon = UIImage(systemName: "play")
        static let pauseIcon = UIImage(systemName: "pause")
    }
    
    enum Color {
        static let workStatusColor = UIColor.systemRed
        static let restStatusColor = UIColor.systemGreen
    }
    
    
    
}

