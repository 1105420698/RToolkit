
#if canImport(CloudKit)
import CloudKit
#endif

class Runkaikit {
    func retrieveCloudKitRecord(withIdentifier id: String) -> CKRecord {
        var record: CKRecord?
        let publicDatabase = CKContainer.default().publicCloudDatabase
        let recordID = CKRecord.ID(recordName: id)
        publicDatabase.fetch(withRecordID: recordID, completionHandler: { recordRetrieved, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                record = recordRetrieved
            }
        })
        
        return record!
    }
    
    func retrieveHTML(fromURL url: String) -> String {
        guard let myURL = URL(string: url) else {
            print("Error: \(url) doesn't seem to be a valid URL")
            return "Error: \(url) doesn't seem to be a valid URL"
        }

        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
            return myHTMLString
        } catch let error {
            return error.localizedDescription
        }
    }
    
    func isIcloudAvailable() -> Bool {
        
        var result: Bool?
        
        CKContainer.default().accountStatus(completionHandler: { accountStatus, error in
            if accountStatus == .noAccount {
                result = false
            } else {
                result = true
            }
        })
        
        return result!
    }
    
    func isFirstTimeLaunch() -> Bool {
        if (UserDefaults.standard.bool(forKey: "HasLaunchedOnce")) {
           return false
        } else {
           // This is the first launch ever
           UserDefaults.standard.set(true, forKey: "HasLaunchedOnce")
           UserDefaults.standard.synchronize()
           return true
        }
    }
}


