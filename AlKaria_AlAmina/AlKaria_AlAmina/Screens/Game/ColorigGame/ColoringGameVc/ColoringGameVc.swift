//
//  ColoringGameVc.swift
//  AlKaria_AlAmina
//
//  Created by Anwar Hajji on 21/11/2022.
//

import UIKit
import simd
#if canImport(PhotosUI)
import PhotosUI
#endif

class ColoringGameVc: UIViewController, Storyboarded, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK:- Outlets from Storyboard
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var lineWidthSlider: UISlider!
    @IBOutlet var lastColor: UIButton!
    @IBOutlet var undoButton: UIButton!
    @IBOutlet weak var tools: UIStackView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var undoView: UIView!
    @IBOutlet weak var saveImageView: UIView!
    @IBOutlet weak var clearView: UIView!
    
    //Our current Coloring Book View
    var coloringBookView:ColoringBookView? = nil
    private var horizontalConstrains:[NSLayoutConstraint]? = nil
    private var verticalConstrains:[NSLayoutConstraint]? = nil
    private var toolsHiddenState:Bool = false
    
    var gameModel: ColoringGameMenuModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.gradientColor(startColor: .offWhite, endColor: .paleSkyBlue)
        setupMEnuView(view: clearView)
        setupMEnuView(view: undoView)
        setupMEnuView(view: saveImageView)
        //Set the controller as ScrollView delegate and change the pan gesture to two fingers for easier drawing
        self.scrollView.delegate = self
        self.scrollView.panGestureRecognizer.minimumNumberOfTouches = 2
        scrollView.zoomScale = 1
        scrollView.maximumZoomScale = 6
        scrollView.minimumZoomScale = 0.6
        
        self.lastColor.backgroundColor = .white
        self.lastColor.tag = 999
        
        //Recreate the last used image
        if let gameModel = gameModel {
            if let image = UIImage(named: gameModel.image_name){
                self.createColoringBookView(with: image, optimized: true)
            }
        }
        
    }
    
    func setupMEnuView(view: UIView) {
        view.layer.cornerRadius = 21
        view.menuViewGradientColor(startColor: .warmPink, endColor: .amethyst, cornerRadius: 21)
    }
    
    func saveImage(image: UIImage) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("fileNe.png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    private func createColoringBookView(with image:UIImage, optimized:Bool = true){
        //Save the last stroke color we used, if none is found choose red
        let lastColor:UIColor = self.coloringBookView?.currentColor ?? .red
        self.coloringBookView?.removeFromSuperview()
        
        //A warning view of the image being processed
        let messageView = UIView()
        messageView.translatesAutoresizingMaskIntoConstraints = false
        messageView.backgroundColor = .white
        
        let label = UILabel()
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        let loader = LoaderView(frame: frame)
        loader.tag = Utilities.loaderViewTag
        loader.controlView.backgroundColor = .clear
        messageView.insertSubview(loader, at: 0)
        loader.backgroundColor = .clear
        messageView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        let topAnchor = label.topAnchor.constraint(equalTo: messageView.topAnchor, constant: 100)
        let widthAnchor = label.widthAnchor.constraint(equalToConstant: 250)
        let centerXAnchor = label.centerXAnchor.constraint(equalTo: messageView.centerXAnchor)
        NSLayoutConstraint.activate([topAnchor, widthAnchor, centerXAnchor])
        label.text = "جارٍ معالجة صورتك حاليًا ، يرجى الانتظار"
        label.textAlignment = .center
        label.numberOfLines = 3
        
        UIView.transition(with: self.view,
                          duration: 0.3,
                          options: .transitionCrossDissolve) {
            messageView.fixInView(self.view)
        }
        
        
        DispatchQueue.global(qos: .background).async{
            //Create the coloring image struct in a background thread
            let coloringImage = ColoringImage(from: image, optimized: optimized)
            
            //Once done return to the main thread
            DispatchQueue.main.async{
                messageView.removeFromSuperview()
                //Create the Coloring Book View
                self.coloringBookView = ColoringBookView(coloringImage: coloringImage)
                self.scrollView.addSubview(self.coloringBookView!)
                //Add to scrollView settings constraints
                self.coloringBookView?.translatesAutoresizingMaskIntoConstraints = false
                
                let topC = self.coloringBookView?.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
                let bottomC = self.coloringBookView?.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
                let leadingC = self.coloringBookView?.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor)
                let trailingC = self.coloringBookView?.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
                
                topC!.isActive = true
                bottomC!.isActive = true
                leadingC!.isActive = true
                trailingC!.isActive = true
//
                self.horizontalConstrains = [leadingC!,trailingC!]
                self.verticalConstrains = [topC!,bottomC!]
                
                //Change the default color and width of the new coloring Book View
                self.coloringBookView?.currentColor = lastColor
                self.coloringBookView?.currentWidth = CGFloat(simd_mix(1.0, 40.0, self.lineWidthSlider.value))
                
                self.coloringBookView?.delegate = self
                self.saveImage(image, optimized: optimized)
                self.checkColoringBookState()
            }
        }
    }
    
    @IBAction func colorPressed(_ sender: UIButton) {
        //If sender tag is 999 we might need to open the color wheel
        if sender.tag == 999{
            if #available(iOS 14, *){
                let colorPicker = UIColorPickerViewController()
                colorPicker.delegate = self
                colorPicker.selectedColor = self.coloringBookView?.currentColor ?? .white
                self.present(colorPicker, animated: true)
            }
            return
        }
        
        //If not change the Stroke color from the background of the sender
        if let color = sender.backgroundColor{
            coloringBookView?.currentColor = color
        }
    }
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        coloringBookView?.currentWidth = CGFloat(simd_mix(1.0, 40.0, lineWidthSlider.value))
    }
    
    @IBAction func clearDrawing(_ sender: Any) {
        //Send clear action to Coloring Book
        self.coloringBookView?.clear()
        self.checkColoringBookState()
    }
    
    @IBAction func undo(_ sender: Any) {
        self.coloringBookView?.undo()
        self.checkColoringBookState()
    }
    
    
    @IBAction func saveImage(_ sender: Any) {
        if let coloringImage = self.coloringBookView?.snapshot(of: self.coloringBookView?.bounds), let image = coloringImage.imageByMakingWhiteBackgroundTransparent() {
            guard let pngData = image.pngData() else {return}
            showCustomAlert(title: "الرجاء التأكيد", message: "هل أنت موافق على حفظ الصورة ؟") {
                self.saveImage(picture: pngData)
            }
        }
    }
    
    private func saveImage(_ image:UIImage, optimized:Bool){
        guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("savedImage.png")
        else {return}
        
        guard let pngData = image.pngData() else {return}
        
        do{
            try pngData.write(to: url)
        }
        catch{
            NSLog("Image couldn't be saved to disk!!!!!!")
        }
        
        UserDefaults.standard.set(optimized, forKey: "optimized")
        
        
    }
    
    private func retrieveSavedImage()->(UIImage?, Bool?){
        let image:UIImage?
        let optimized:Bool?
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("savedImage.png"){
            image = UIImage(contentsOfFile: url.path)
        }
        else{
            image = nil
        }
        
        optimized = UserDefaults.standard.value(forKey: "optimized") as? Bool
        
        return (image,optimized)
        
    }
    
    private func checkColoringBookState(){
        self.undoButton.isEnabled = coloringBookView?.canUndo ?? false
    }
}

extension ColoringGameVc:UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //Send the coloring book view as a the view to zoom
        return self.coloringBookView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerColoringView()
    }
    
    func centerColoringView(){
        let offsetX = max(0,(scrollView.bounds.width - scrollView.contentSize.width) / 2.0)
        let offsetY = max(0,(scrollView.bounds.height - scrollView.contentSize.height) / 2.0)
        
        self.horizontalConstrains?.forEach{
            $0.constant = offsetX
        }
        
        self.verticalConstrains?.forEach{
            $0.constant = offsetY
        }
    }
}

extension ColoringGameVc:UIColorPickerViewControllerDelegate{
    @available(iOS 14.0, *)
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        self.coloringBookView?.currentColor = viewController.selectedColor
    }
}

extension ColoringGameVc:ColoringBookViewDelegate{
    
    func viewWillStartDrawing() {
    }
    
    func viewDidEndDrawing() {
        self.checkColoringBookState()
    }
    
}


extension UIView {
    func snapshot(of rect: CGRect? = nil, afterScreenUpdates: Bool = true) -> UIImage {
            return UIGraphicsImageRenderer(bounds: rect ?? bounds).image { _ in
                drawHierarchy(in: bounds, afterScreenUpdates: afterScreenUpdates)
            }
        }
}

extension UIImage {
    func imageByMakingWhiteBackgroundTransparent() -> UIImage? {

        let image = UIImage(data: self.jpegData(compressionQuality: 1.0)!)!
        let rawImageRef: CGImage = image.cgImage!

        let colorMasking: [CGFloat] = [222, 255, 222, 255, 222, 255]
        UIGraphicsBeginImageContext(image.size);

        let maskedImageRef = rawImageRef.copy(maskingColorComponents: colorMasking)
        UIGraphicsGetCurrentContext()?.translateBy(x: 0.0,y: image.size.height)
        UIGraphicsGetCurrentContext()?.scaleBy(x: 1.0, y: -1.0)
        UIGraphicsGetCurrentContext()?.draw(maskedImageRef!, in: CGRect.init(x: 0, y: 0, width: image.size.width, height: image.size.height))
        let result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return result

    }

}
