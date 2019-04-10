//
//  ViewController.swift
//  rsa
//
//  Created by Кирилл Пархоменко on 05/04/2019.
//  Copyright © 2019 Kirill Parhomenko. All rights reserved.
//

import Cocoa
import Foundation

class ViewController: NSViewController {
    
    //system method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.title = "RSA encryption and decryption"
        self.view.window?.styleMask.remove(NSWindow.StyleMask.resizable)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    //action and outlet
    @IBOutlet weak var publicKey: NSTextField!
    @IBOutlet weak var privateKey: NSTextField!
    
    @IBOutlet weak var t2eOrDecTex: NSTextField!
    @IBOutlet weak var encTextOrT2D: NSTextField!
    
    
    @IBOutlet weak var msgLabel: NSTextField!
    
    @IBAction func encryptBtn(_ sender: NSButton) {
        let charIndexArray = ConvertCharToIndex(arrayOfSymbols: arrayOfSymbols)
        //print(testString.count)
        print(testString)
        print(charIndexArray)
        //print(decodedArrayOfSymbols.count)
    }
    @IBAction func decryptBtn(_ sender: NSButton) {
    }
    
    
    //main code
    let generator = Generator()
    
    lazy var tempP = generator.generateP()
    lazy var tempQ = generator.generateQ()
    
    var tempEuler = EulerGenerator()
    let PQParams = PQChecker()
    
    lazy var params = PQParams.checkPQ(p: tempP, q: tempQ)
    lazy var p = params.0
    lazy var q = params.1
    
    lazy var euler = tempEuler.getEuler(p: p, q: q)
    lazy var paramD = generator.generateD(euler: euler)
    lazy var paramE = generator.generateE(paramD: paramD, euler: euler)
    
    
    //alphabet arrays
    let alphabetArray = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "э", "ю", "я", "А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Э", "Ю", "Я", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "!", "@", "#", "$", "%", "&", "?", "-", "+", "=", "~", " "]
    
    let testString = "Super secret message!"
    lazy var arrayOfSymbols = testString.splitedBy(length: 1)

    
    func ConvertCharToIndex(arrayOfSymbols: [String]) -> [String] {
        var charToIndexArray = [String]()
        for elementIndex in 0...arrayOfSymbols.count - 1 {
            let charInArrayOfSymbols: String = arrayOfSymbols[elementIndex]
            
            if alphabetArray.contains(charInArrayOfSymbols) {
                let dataToAppend: Int = alphabetArray.firstIndex(of: charInArrayOfSymbols) ?? 0
                charToIndexArray.append(String(dataToAppend))
            }
        }
        
        return charToIndexArray
    }
    
    
}
