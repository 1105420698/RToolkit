
#if canImport(CloudKit)
import CloudKit
#endif

public class RunkaiKit {
    #if canImport(CloudKit)
    /**
     Retrieve the corresponding record with the given id. Throws an error when encounters one.
    - parameters:
        - id: The id that is going to be used.
        - public: The location of the target database can be either public or private.
      */
    func retrieveCloudKitRecord(withIdentifier id: String, public: Bool) throws -> CKRecord  {
        var record: CKRecord?
        var error: Error?
        let publicDatabase = CKContainer.default().publicCloudDatabase
        let recordID = CKRecord.ID(recordName: id)
        
        publicDatabase.fetch(withRecordID: recordID, completionHandler: { recordRetrieved, errorReceived in
            if let errorReceived = errorReceived {
                error = errorReceived
            } else {
                record = recordRetrieved
            }
        })
        
        if let error = error {
            throw error
        } else if let record = record {
            return record
        } else {
            throw error!
        }
    }
    
    /**
     Retrieve the raw HTML code from the URL provided.
     - parameters:
        - url: A string containing the URL of your target webpage.
     
     - Returns:
        - The HTML in its `String` form if the process succeeds.
        - An error if it the process fails.
        - An error if the input is not a valid URL.
     */
    func retrieveHTML(from url: String) -> String {
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
    #endif
    
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


