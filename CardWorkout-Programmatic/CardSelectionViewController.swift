//
//  CardSelectionViewController.swift
//  CardWorkout-Programmatic
//
//  Created by Maggie Hillebrecht on 8/4/24.
//

import UIKit

class CardSelectionViewController: UIViewController {

    let cardImageView = UIImageView()
    let stopButton = CWButton(backgroundColor: .red, title: "Stop")
    let resetButton = CWButton(backgroundColor: .green, title: "Reset")
    let rulesButton = CWButton(backgroundColor: .blue, title: "Rules")
    
    var cards: [UIImage] = CardDeck.allValues
    var timer: Timer! //initalize
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground //white in lightmode and black in darkmode
        ConfigureUI()
        StartTimer()
        // Do any additional setup after loading the view.
    }
    
    @objc func ShowRandomImage(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    func StartTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ShowRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func StopTimer() {
        timer.invalidate()
    }
    
    @objc func RestartTimer(){
        timer.invalidate()
        StartTimer()
    }

    func ConfigureUI() {
        ConfigureCardImageView()
        ConfigureStopButton()
        ConfigureResetButton()
        ConfigureRulesButton()
    }
    
    func ConfigureCardImageView(){
        view.addSubview(cardImageView)//us hitting the plus button and adding the sub view to the storyboard
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        //constraints
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), //centering card image in the view
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75) //slid the image up by 75 pixels
        ])
    }
    
    func ConfigureStopButton(){
        view.addSubview(stopButton) //dragging button onto storyboard
        stopButton.addTarget(self, action: #selector(StopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func ConfigureResetButton(){
        view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(RestartTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func ConfigureRulesButton(){
        view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(PresentRulesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func PresentRulesVC(){ 
        
        present(RulesViewController(), animated: true)
    }
}
