# DDPTest
get-high iOS-swift demostration app

## Welcome VieZite iOS handawesomes!

This is a demostration of how to use SwiftDDP connection to our backend.  
*Modified version from original SwiftDDP as well as some fixings*

## Configurations

* Proceed normal cocoapod installation as well as SwiftDDP
  
* SERVER ADDRESS: wss://www.loopcowstudio.com
* SSL: true

## Modification in POD ~> SwiftDDP

- DDPExtensions.swift
Fixed nil user() error when logout current user.  
**Replace function logout at line 462 with**  
```Swift
public func logout(callback:DDPMethodCallback?) {
      method("logout", params: nil) { result, error in
              if (error == nil) {
                  self.userMainQueue.addOperationWithBlock() {
                      // Edited by Lu
                      let user = self.user()
                      NSNotificationCenter.defaultCenter().postNotificationName(DDP_USER_DID_LOGOUT, object: nil)
                      if let _ = self.delegate {
                          self.delegate!.ddpUserDidLogout(user!)
                      }
                      // End
                      self.resetUserData()
                  }
                  
              } else {
                  log.error("\(error)")
              }
              
              if let c = callback { c(result: result, error: error) }
          }
      }
```

- MeteorOAuthServices.swift
Added scopes request for google oauth2 service, also force reprompt and request offline token.  
**Replace google function at line 72**  

```Swift
public static func google(clientId: String) -> String {
        
        let token = randomBase64String()
        let httpUrl = MeteorOAuth.httpUrl
        let redirect = "\(httpUrl)/_oauth/google"
        let state = MeteorOAuth.stateParam(token, redirectUrl: redirect)

        // Added by Lu
        let scope = "email+https://www.googleapis.com/auth/calendar"
        // End
        
        var url = "https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=\(clientId)"
        // Added by Lu
        url += "&approval_prompt=force"
        url += "&access_type=offline"
        // End
        url += "&redirect_uri=\(redirect)"
        url += "&scope=\(scope)"
        url += "&state=\(state)"
        
        return url
    }
```
