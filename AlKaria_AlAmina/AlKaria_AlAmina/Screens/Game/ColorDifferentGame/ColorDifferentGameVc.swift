//
//  ColorDifferentGameVcViewController.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 23/11/2022.
//

import UIKit

class ColorDifferentGameVc: UIViewController, Storyboarded {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bestScoreView: UIView!
    @IBOutlet weak var myScoreView: UIView!
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var progressTimeView: UIProgressView!
    @IBOutlet weak var bestScoreStaticLbl: UILabel!
    @IBOutlet weak var myScoreStaticLbl: UILabel!
    @IBOutlet weak var bestScoreLbl: UILabel!
    @IBOutlet weak var myscoreLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cellCount: Int = 4
    
    var currentColor = UIColor.random()
    var colorList = [UIColor]()
    var score: Int = 0
    var bestScore: Int = 0
    var indexOfDifferentColor: Int = 0
    var currentProgress: Float = 0
    private var playerTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.backgroundColor  = .lightPink
        progressTimeView.tintColor = .brightTeal
        screenTitle.text = "فصل الألوان"
        screenTitle.textColor = .pinkRed
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initView()
        getBestScore()
    }
    
    
    func initView() {
        setupScroeView(view: myScoreView)
        setupScroeView(view: bestScoreView)
        myScoreStaticLbl.text = "مجموع النقاط"
        bestScoreStaticLbl.text = "أفضل نتيجة"
        myscoreLbl.backgroundColor = .limeYellow
        bestScoreLbl.backgroundColor = .limeYellow
        bestScoreLbl.layer.cornerRadius = 10
        myscoreLbl.layer.cornerRadius = 10
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionViewLayout.minimumLineSpacing = 1
        collectionViewLayout.minimumInteritemSpacing = 1
        myscoreLbl.text = "\(score)"
        progressTimeView.progress = 0
        generateRandomColor()
    }
    
    func setupScroeView(view: UIView) {
        view.layer.borderColor = UIColor.brightSkyBlue.cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 10
        view.backgroundColor = .limeYellow
    }
    
    func startTimer() {
        playerTimer = Timer(timeInterval: 1, target: self, selector: #selector(increaseProgress), userInfo: nil, repeats: true)
        RunLoop.current.add(playerTimer!, forMode: .default)
    }
    
    @objc func increaseProgress() {
        if currentProgress >=  1 {
            playerTimer?.invalidate()
            Router.shared.present(screen: .ScoreScreen(score: score, bestScore: bestScore), modalePresentatioinStyle: .fullScreen, completion: nil)
            return
        }
        currentProgress += 0.1
        progressTimeView.setProgress(currentProgress, animated: true)
        
    }
    
    func nextLevel() {
        if score >= cellCount {
            let x = sqrt(Double(cellCount))
            let res = x + 1
            cellCount = Int((res * res))
        }
        currentColor = UIColor.random()
        generateRandomColor()
        collectionView.reloadData()
    }
    
    func generateRandomColor() {
        colorList.removeAll()
        let randomInt = Int.random(in: 0..<cellCount)
        for i in 0 ... cellCount - 1 {
            if randomInt == i {
                indexOfDifferentColor = i
                colorList.append(currentColor.withAlphaComponent(0.8))
            } else {
                colorList.append(currentColor)
            }
        }
    }
    
    func isCorrect(index: Int) -> Bool {
        if index == indexOfDifferentColor {
            score += 1
            myscoreLbl.text = "\(score)"
            currentProgress = 0.0
            self.progressTimeView.setProgress(0, animated: true)
            playerTimer?.invalidate()
            return true
        } else {
            print("You lose")
            insertScore()
            playerTimer?.invalidate()
            Router.shared.present(screen: .ScoreScreen(score: score, bestScore: bestScore), modalePresentatioinStyle: .fullScreen, completion: nil)
            return false
        }
    }
    
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension ColorDifferentGameVc: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorDifferentCollectionViewCell", for: indexPath) as? ColorDifferentCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(color: colorList[indexPath.row], index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if isCorrect(index: indexPath.row) {
            startTimer()
            nextLevel()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let padding: CGFloat = 1
        let square = sqrt(Double(cellCount))
        let collectionViewSize = collectionView.frame.size.width - (padding * (square - 1))
        return CGSize(width: collectionViewSize / square, height: collectionViewSize / square)
    }
    
    
}






