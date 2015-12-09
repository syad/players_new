
import Foundation
import UIKit
import CoreData
class Squadre_seriA: UITableViewController {
    var appDelegate :AppDelegate?
    var context :NSManagedObjectContext?
    var entityRosa :NSEntityDescription?
    var entitySquadre_down :NSEntityDescription?
    var entityGiocatori_down :NSEntityDescription?
    // data array
    var array = [String]()
    var array2 = [String]()
    var array3 = [String]()
    var arrayImp = [String]()
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
        self.view.removeFromSuperview()
    }
    struct SquadraA {
        static var squadradaA = ""
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "togiocatoriSa"{
        }
    }

    override func viewDidLoad() {
        self.title = "Scegli una squadra"
        navigationController!.navigationBar.barTintColor = UIColorFromRGB(0xe75c56)
        navigationController!.navigationBar.barStyle = UIBarStyle.Black
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        appDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        context = appDelegate!.managedObjectContext
        entitySquadre_down = NSEntityDescription.entityForName("Squadre_down", inManagedObjectContext: context!)
        let request = NSFetchRequest(entityName: "Squadre_down")
        request.returnsObjectsAsFaults = false
        
        let results :NSArray = try! context!.executeFetchRequest(request)
        let conteggio = results.count as Int
        if (conteggio > 0) {
            for user in results as! [Squadre_down] {
                let idsquadra = user.id
                let testo2 = user.squadra
                let testo3 = user.immagine
                array.append(idsquadra)
                array2.append(testo2)
                array3.append(testo3)
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
        SquadraA.squadradaA = string!
        navigationController!.popViewControllerAnimated(true)
        self.performSegueWithIdentifier("togiocatoriSa", sender: self)
    }

}