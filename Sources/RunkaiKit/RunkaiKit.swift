
#if canImport(CloudKit)
import CloudKit
#endif

/// The main structure of RunkaiKit where most of the general functions rests.
public struct RunkaiKit {
    
    #if canImport(CloudKit)
    /**
     Retrieve the corresponding record with the given id. Throws an error when encounters one.
    - parameters:
        - id: The id that is going to be used.
        - public: The location of the target database can be either public or private.
      */
    public func retrieveCloudKitRecord(withIdentifier id: String, public: Bool) throws -> CKRecord  {
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
    public func retrieveHTML(from url: String) -> String {
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
    
    /**
    Detect whether this is the device as an iCloud account logged on.
    
     Just place this function in the `viewDidLoad()` or `AppDelegate` of your app to use it.
    - Returns: A `Bool` to indicate whether this is the device as an iCloud account logged on.
    */
    public func isIcloudAvailable() -> Bool {
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
    
    /**
     Detect whether this is the first time this app ever launched.
     - Returns: A `Bool` to indicate whether this is the first time this app ever launched.
     */
    public func isFirstTimeLaunch() -> Bool {
        if UserDefaults.standard.bool(forKey: "HasLaunchedOnce") {
           return false
        } else {
           UserDefaults.standard.set(true, forKey: "HasLaunchedOnce")
           UserDefaults.standard.synchronize()
           return true
        }
    }
}


