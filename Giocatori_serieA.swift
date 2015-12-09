
import Foundation
import UIKit
import CoreData


class Giocatori_serieA: UITableViewController {
    var appDelegate :AppDelegate?
    var context :NSManagedObjectContext?
    var entityRosa :NSEntityDescription?
    var entitySquadre_down :NSEntityDescription?
    var entityGiocatori_down :NSEntityDescription?
    // data array
    var array = [String]()
    var array2 = [String]()
    var array3 = [String]()
    func reachabilityStatusChanged() -> Int {
        if reachabilityStatus == kNOTREACHABLE {
            return 0
        } else {
            // chiamo json e salvo gli utenti a db
            return 1
        }
    }
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name:"ReachStatusChanged",object:nil)
    }
    var id_sss = ""

    override func viewDidLoad() {
        self.title = "Scegli un giocatore"
        navigationController!.navigationBar.barTintColor = UIColorFromRGB(0xe75c56)
        navigationController!.navigationBar.barStyle = UIBarStyle.Black
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        id_sss = SquadreTable.Squadrarosa.squadraperosa
        let id_sA = Squadre_seriA.SquadraA.squadradaA
        appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        context = appDelegate!.managedObjectContext
        entityRosa = NSEntityDescription.entityForName("Rosa_db", inManagedObjectContext: context!)
        entitySquadre_down = NSEntityDescription.entityForName("Giocatori_down", inManagedObjectContext: context!)
        let request = NSFetchRequest(entityName: "Giocatori_down")
        request.returnsObjectsAsFaults = false
        let predicate3 = NSPredicate(format: "ruolo == 1 AND squadra_id == " + id_sA, argumentArray: nil)
        request.predicate = predicate3
        array.append("0")
        array2.append("Portieri")
        array3.append("")

        let results :NSArray = try! context!.executeFetchRequest(request)
        let conteggio = results.count as Int
        if (conteggio > 0) {
            for user in results as! [Giocatori_down] {
                let idgiocatore = user.id
                let testo2 = user.giocatore
                let request = NSFetchRequest(entityName: "Rosa_db")
                request.returnsObjectsAsFaults = false
                let predicate3 = NSPredicate(format: "id_squadra == " + id_sss + " AND id == " + idgiocatore , argumentArray: nil)
                request.predicate = predicate3
                let fetchResults3 :NSArray = try! context!.executeFetchRequest(request)
                let conto = fetchResults3.count as Int

                if (conto == 0) {
                    let request2 = NSFetchRequest(entityName: "Squadre_down")
                    request2.returnsObjectsAsFaults = false
                    let predicate2 = NSPredicate(format: "id == " + id_sA, argumentArray: nil)
                    request2.predicate = predicate2
                    let fetchResults2 = try! context!.executeFetchRequest(request2) as? [NSManagedObject]
                    let managedObject2 = fetchResults2![0] as NSManagedObject
                    let testo3 = managedObject2.valueForKey("immagine")as! String
                    array.append(idgiocatore)
                    array2.append(testo2)
                    array3.append(testo3)
                }
            }
        }
        
        let request2 = NSFetchRequest(entityName: "Giocatori_down")
        request2.returnsObjectsAsFaults = false
        let predicate22 = NSPredicate(format: "ruolo == 2 AND squadra_id == " + id_sA, argumentArray: nil)
        request2.predicate = predicate22
        array.append("0")
        array2.append("Difensori")
        array3.append("")
        
        let results2 :NSArray = try! context!.executeFetchRequest(request2)
        let conteggio2 = results2.count as Int
        if (conteggio2 > 0) {
            for user in results2 as! [Giocatori_down] {
                let idgiocatore = user.id
                let testo2 = user.giocatore
                let request = NSFetchRequest(entityName: "Rosa_db")
                request.returnsObjectsAsFaults = false
                let predicate3 = NSPredicate(format: "id_squadra == " + id_sss + " AND id == " + idgiocatore , argumentArray: nil)
                request.predicate = predicate3
                let fetchResults3 :NSArray = try! context!.executeFetchRequest(request)
                let conto = fetchResults3.count as Int
                
                if (conto == 0) {
                    let request2 = NSFetchRequest(entityName: "Squadre_down")
                    request2.returnsObjectsAsFaults = false
                    let predicate2 = NSPredicate(format: "id == " + id_sA, argumentArray: nil)
                    request2.predicate = predicate2
                    let fetchResults2 = try! context!.executeFetchRequest(request2) as? [NSManagedObject]
                    let managedObject2 = fetchResults2![0] as NSManagedObject
                    let testo3 = managedObject2.valueForKey("immagine")as! String
                    array.append(idgiocatore)
                    array2.append(testo2)
                    array3.append(testo3)
                }
            }
        }

        let request3 = NSFetchRequest(entityName: "Giocatori_down")
        request3.returnsObjectsAsFaults = false
        let predicate23 = NSPredicate(format: "ruolo == 3 AND squadra_id == " + id_sA, argumentArray: nil)
        request3.predicate = predicate23
        array.append("0")
        array2.append("Centrocampisti")
        array3.append("")
        
        let results3 :NSArray = try! context!.executeFetchRequest(request3)
        let conteggio3 = results3.count as Int
        if (conteggio3 > 0) {
            for user in results3 as! [Giocatori_down] {
                let idgiocatore = user.id
                let testo2 = user.giocatore
                let request = NSFetchRequest(entityName: "Rosa_db")
                request.returnsObjectsAsFaults = false
                let predicate3 = NSPredicate(format: "id_squadra == " + id_sss + " AND id == " + idgiocatore , argumentArray: nil)
                request.predicate = predicate3
                let fetchResults3 :NSArray = try! context!.executeFetchRequest(request)
                let conto = fetchResults3.count as Int
                
                if (conto == 0) {
                    let request2 = NSFetchRequest(entityName: "Squadre_down")
                    request2.returnsObjectsAsFaults = false
                    let predicate2 = NSPredicate(format: "id == " + id_sA, argumentArray: nil)
                    request2.predicate = predicate2
                    let fetchResults2 = try! context!.executeFetchRequest(request2) as? [NSManagedObject]
                    let managedObject2 = fetchResults2![0] as NSManagedObject
                    let testo3 = managedObject2.valueForKey("immagine")as! String
                    array.append(idgiocatore)
                    array2.append(testo2)
                    array3.append(testo3)
                }
            }
        }

      
        let request4 = NSFetchRequest(entityName: "Giocatori_down")
        request4.returnsObjectsAsFaults = false
        let predicate24 = NSPredicate(format: "ruolo == 4 AND squadra_id == " + id_sA, argumentArray: nil)
        request4.predicate = predicate24
        array.append("0")
        array2.append("Attaccanti")
        array3.append("")
        
        let results4 :NSArray = try! context!.executeFetchRequest(request4)
        let conteggio4 = results4.count as Int
        if (conteggio4 > 0) {
            for user in results4 as! [Giocatori_down] {
                let idgiocatore = user.id
                let testo2 = user.giocatore
                let request = NSFetchRequest(entityName: "Rosa_db")
                request.returnsObjectsAsFaults = false
                let predicate3 = NSPredicate(format: "id_squadra == " + id_sss + " AND id == " + idgiocatore , argumentArray: nil)
                request.predicate = predicate3
                let fetchResults3 :NSArray = try! context!.executeFetchRequest(request)
                let conto = fetchResults3.count as Int
                
                if (conto == 0) {
                    let request2 = NSFetchRequest(entityName: "Squadre_down")
                    request2.returnsObjectsAsFaults = false
                    let predicate2 = NSPredicate(format: "id == " + id_sA, argumentArray: nil)
                    request2.predicate = predicate2
                    let fetchResults2 = try! context!.executeFetchRequest(request2) as? [NSManagedObject]
                    let managedObject2 = fetchResults2![0] as NSManagedObject
                    let testo3 = managedObject2.valueForKey("immagine")as! String
                    array.append(idgiocatore)
                    array2.append(testo2)
                    array3.append(testo3)
                }
            }
        }

    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    // MARK: TableView Data source methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! Customcellwithimage
        cell.customLabel.text = array2[indexPath.row]
        cell.detailsLabel.text = array[indexPath.row]
        cell.imageV.image = UIImage(named: array3[indexPath.row])        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! Customcellwithimage
        let string = cell.detailsLabel?.text
        if (string != "0") {
            if (Rosa.Giocatorerosa.giocatore_id == "") {
                addPlayers(string!, squadra: string!)
            } else {
                let request = NSFetchRequest(entityName: "Rosa_db")
                request.returnsObjectsAsFaults = false
                let predicate = NSPredicate(format: "id == %@", Rosa.Giocatorerosa.giocatore_id)
                request.predicate = predicate
                let fetchResults = try! self.context!.executeFetchRequest(request) as? [NSManagedObject]
                let managedObject = fetchResults![0]
                self.context!.deleteObject(managedObject)
                addPlayers(string!, squadra: string!)
            }
        }
    }
    
    func addPlayers(id:String, squadra:String) {
        let nuovasquadra = Rosa_db(entity: entityRosa!, insertIntoManagedObjectContext: context)
        nuovasquadra.giocatore_id = id
        nuovasquadra.id = squadra
        nuovasquadra.id_squadra = id_sss
        nuovasquadra.panchinaro = "0"
        nuovasquadra.titolare = "0"
        salvaContext()
    }
    
    func salvaContext() {
        _ = NSErrorPointer()
        do {
            try self.context?.save()
        } catch {
            print(error)
        }
        let loginViewController = self.storyboard!.instantiateViewControllerWithIdentifier("rosa")
        UIApplication.sharedApplication().keyWindow?.rootViewController = loginViewController
    }

    
}
