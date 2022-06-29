//
//  ViewController2.swift
//  AppTimer
//
//  Created by user on 16/06/22.
//

import UIKit

class ViewController2: UIViewController {
    
    //inizializzazione variabili
    var x = 0
    var max = 5
    var timer = Timer()
    var millesimi = 0
    var sec = 0
    var endtime = 0
    var a = 0
    var b = 0
    var ris  = 0
    var points = 0
    var sbaglio1 = 0
    var sbaglio2 = 0
    var sbaglio3 = 0
    var bestScore = 0
    
    //Inizializzazzione bottoni per poterli nascondere
    @IBOutlet weak var startButton2: UIButton!
    
    @IBOutlet weak var res1Button: UIButton!
    @IBOutlet weak var res2Button: UIButton!
    @IBOutlet weak var res3Button: UIButton!
    @IBOutlet weak var res4Button: UIButton!
    
    //Labl per visualizzare la tabellina da indovinare
    @IBOutlet weak var tabellinaDaIndovinare: UILabel!
    
    
    //label per visualizzare il punteggio e il miglior punteggio
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var best: UILabel!
    
    //label per visualizare le opzioni
    @IBOutlet weak var res1: UILabel!
    @IBOutlet weak var res2: UILabel!
    @IBOutlet weak var res3: UILabel!
    @IBOutlet weak var res4: UILabel!
    
    //Quando primo tasto premuto
    @IBAction func result1(_ sender: UIButton) {
        if  res1.text == String(a*b){
            points += 1
            score.text = String(points)
            newTab()
        } else {
            res1Button.tintColor = UIColor.red
            points -= 1
            score.text = String(points)
        }
        
    }
    
    //quando premo secondo possibile risultato
    @IBAction func result2(_ sender: UIButton) {
        if  res2.text == String(a*b){
            points += 1
            score.text = String(points)
            newTab()
            
        } else {
            res2Button.tintColor = UIColor.red
            points -= 1
            score.text = String(points)
        }
        
    }
    
    //quando premo il terzo risultato
    @IBAction func result3(_ sender: UIButton) {
        if  res3.text == String(a*b){
            points += 1
            score.text = String(points)
            newTab()
        }else {
            res3Button.tintColor = UIColor.red
            points -= 1
            score.text = String(points)
        }
        
    }
    
    @IBAction func result4(_ sender: UIButton) {
        if  res4.text == String(a*b){
            points += 1
            score.text = String(points)
            newTab()
        }else {
            res4Button.tintColor = UIColor.red
            points -= 1
            score.text = String(points)
        }
    }
    
    
    //Inizializzazione label timer
    @IBOutlet weak var secondi: UILabel!
    @IBOutlet weak var millSec: UILabel!
    
    //quando premo il tasto start
    @IBAction func startButton(_ sender: UIButton) {
        //nascondo il tasto start
        startButton2.isHidden = true
        
        //compaiono i tasti risultato
        res1Button.isHidden = false
        res2Button.isHidden = false
        res3Button.isHidden = false
        res4Button.isHidden = false
        res1.isHidden = false
        res2.isHidden = false
        res3.isHidden = false
        res4.isHidden = false
        
        
        //Parte il timer
        timer = Timer.scheduledTimer(timeInterval : 0.001 , target : self , selector : #selector(updateTimer), userInfo : nil , repeats : true)
        
        //genera la prima tabellina
        newTab()
        
        //alla fine del timer si azzera tutto
        millesimi = 0
        sec = 0
        points = 0
        score.text = String(0)
        secondi.text = "00"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(max)
        print(endtime)
        
    }
    
    //Funzione del timer
    @objc func updateTimer(){
        var viewM = "000"
        var viewS = ""
        //Finito il tempo, spariscono le tabelline e ricompare il tasto start
        if sec == endtime{
            
            timer.invalidate()
            startButton2.isHidden = false
            res1Button.isHidden = true
            res2Button.isHidden = true
            res3Button.isHidden = true
            res4Button.isHidden = true
            res1.isHidden = true
            res2.isHidden = true
            res3.isHidden = true
            res4.isHidden = true
            
            //Controllo per il nuovo punteggio migliore
            if  (Int(best.text!) ?? 0) < points {
                best.text = String(points)
            }
        }
        //aggiunta di 0 davanti per una migliore visualizzazione
        if millesimi < 10 {
            viewM = "00" + String(millesimi)
        } else if millesimi < 100 {
            viewM = "0" + String(millesimi)
        } else {
            viewM = String(millesimi)
        }
        millSec.text = viewM
        millesimi += 1

        //incremento e aggiunta di 0 per i secondi
        if millesimi == 1000 {
            millesimi = 0
            sec += 1
            if sec < 10 {
                viewS = "0" + String(sec)
                    
            } else{
                viewS = String(sec)
            }
            secondi.text = viewS
        }
        
    }
    
    //generazione di un numero random
    func generaRandom () -> Int {
        return Int.random(in: 0...max) + self.x
    }
    
    //funzione per mostrarela tabellina da indovinare
    func printTab (a: Int, b: Int){
        tabellinaDaIndovinare.text = "\(a)x\(b)"
    }
    
    //Generazione di una nuova tabellina da indovinare
    func newTab(){
        res1Button.tintColor = UIColor.white
        res2Button.tintColor = UIColor.white
        res3Button.tintColor = UIColor.white
        res4Button.tintColor = UIColor.white
        
        //genero i due numeri
        a = generaRandom()
        b = generaRandom()
        printTab(a: a, b: b)
        ris = a*b
        repeat {
            // genero tre risposte diverse tra loro e dal risultato giusto
            sbaglio1 = generaRandom()*generaRandom()
            sbaglio2 = generaRandom()*generaRandom()
            sbaglio3 = generaRandom()*generaRandom()
        }while sbaglio1 == ris || sbaglio2 == ris || sbaglio1 == sbaglio2 || sbaglio3 == ris || sbaglio3 == sbaglio1 || sbaglio3 == sbaglio2
        
        //scelta casuale della posizione delle risposte
        var arr = [ris, sbaglio1, sbaglio2, sbaglio3]
        for i in 0...3{
            switch i{
            case 0:
                let cas1 = Int(arr.randomElement()!)
                res1.text = String(cas1)
                if let index = arr.firstIndex(of: cas1) {
                    arr.remove(at: index)
                }
            case 1:
                let cas2 = Int(arr.randomElement()!)
                res2.text = String(cas2)
                if let index = arr.firstIndex(of: cas2) {
                    arr.remove(at: index)
                }
            case 2:
                let cas3 = Int(arr.randomElement()!)
                res3.text = String(cas3)
                if let index = arr.firstIndex(of: cas3) {
                    arr.remove(at: index)
                }
            case 3:
                res4.text = String(arr[0])
            default:
                print("")
            }
        }
    }
}
