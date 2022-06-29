//
//  ViewController.swift
//  AppTimer
//
//  Created by user on 16/06/22.
//

//invalidate() //ferma il timer


/*
 Voglio realizzare il gioco delle tabelline (dato il limite di tempo devi indovinare il maggior numero di calcoli che riesci), vorrei essere in grado di gestire diverse modalità di gioco (da facile es: tabelline dall'1 al 5, a difficile es: dall'1 al 10),

    per diverse lunghezze di tempo
    vorrei riuscire a poter anche salvare il punteggio di qualcuno con un nickname.
    diverse operazioni? + - /
 */
import UIKit

class ViewController: UIViewController {
    var endtime = 0
    var max = 0
    var x = 0
    
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var modSelect: UILabel!
    @IBOutlet weak var mod1: UILabel!
    @IBOutlet weak var mod2: UILabel!
    @IBOutlet weak var mod3: UILabel!
    @IBOutlet weak var fiveSecMod: UIButton!
    @IBOutlet weak var tenSecMode: UIButton!
    @IBOutlet weak var tenTenSecMode: UIButton!
    @IBOutlet weak var tenFifteenSecMode: UIButton!
    @IBOutlet weak var fiveToTenTenMode: UIButton!
    @IBOutlet weak var fiveToTenFifteenMode: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let b = sender as! UIButton
        
        if b.tag == 115 {
            self.endtime = 15
            self.max = 5
            self.x = 0
        } else if b.tag == 110{
            self.endtime = 10
            self.max = 5
            self.x = 0
        } else if b.tag == 215{
            self.endtime = 15
            self.max = 10
            self.x = 0
        } else if b.tag == 210{
            self.endtime = 10
            self.max = 10
            self.x = 0
        } else if b.tag == 315{
            self.endtime = 15
            self.max = 5
            self.x = 5
        } else if b.tag == 310{
            self.endtime = 10
            self.max = 5
            self.x = 5
        }
        
        let timeControl = segue.destination as! ViewController2
        timeControl.endtime = self.endtime
        timeControl.max = self.max
        timeControl.x = self.x
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        }
    
   

    
}

