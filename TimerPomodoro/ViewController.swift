//
//  ViewController.swift
//  TimerPomodoro
//
//  Created by Danil Goncharov on 17.10.2021.
//

import UIKit

class ViewController: UIViewController {
    

    // MARK: - Properties
    
    private var timer = Timer()
    
    private var timerCounter = 0 {
        willSet {
            timerLabel.text = newValue < 10 ? "00:0\(newValue)" : "00:\(newValue)"
        }
    }
    private var isWorkTimer = true {
        willSet {
            timerLabel.textColor = newValue ? Color.workStatusColor : Color.restStatusColor
            button.tintColor = newValue ? Color.workStatusColor : Color.restStatusColor
            timerCounter = newValue ? Metric.workTimeDuration : Metric.restTimeDuration
        }
    }
    
    private var isStarted = false {
        didSet {
            button.isSelected = isStarted
        }
    }
    
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
        timerCounter = Metric.workTimeDuration
        isWorkTimer = true
        
        timerLabel.font = .systemFont(ofSize: Metric.fontSize)
        button.setImage(Icon.playIcon, for: .selected)
        button.setImage(Icon.pauseIcon, for: .normal)
        
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
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
    
    //MARK: - Actions
    
    @objc private func TimerAction() {
        guard timerCounter > 0 else {
            isStarted = !isStarted
            isWorkTimer = !isWorkTimer
            timer.invalidate()
            return
        }
        timerCounter -= 1
    }
    
    @objc private func buttonAction() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerAction), userInfo: nil, repeats: true)
        isStarted = !isStarted
    }
    
    
    // MARK: - Constans
    
    enum Metric {
        static let fontSize: CGFloat = 34
        static let buttonTopOffset: CGFloat = 80
        static let workTimeDuration: Int = 15
        static let restTimeDuration: Int = 5
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

