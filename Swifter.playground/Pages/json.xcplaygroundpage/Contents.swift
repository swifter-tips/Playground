
import Foundation

let jsonString = "{\"menu\": {" +
                 "\"id\": \"file\"," +
                 "\"value\": \"File\"," +
                 "\"popup\": {" +
                    "\"menuitem\": [" +
                        "{\"value\": \"New\", \"onclick\": \"CreateNewDoc()\"}," +
                        "{\"value\": \"Open\", \"onclick\": \"OpenDoc()\"}," +
                        "{\"value\": \"Close\", \"onclick\": \"CloseDoc()\"}" +
                    "]" +
                "}" +
            "}}"

let json: Any = try! JSONSerialization.jsonObject(
    with: jsonString.data(using: .utf8, allowLossyConversion: true)!,
    options: [])

if let jsonDic = json as? NSDictionary {
    if let menu = jsonDic["menu"] as? [String: AnyObject] {
        if let popup: AnyObject = menu["popup"] {
            if let popupDic = popup as? [String: AnyObject] {
                if let menuItems: AnyObject = popupDic["menuitem"] {
                    if let menuItemsArr = menuItems as? [AnyObject] {
                        if let item0 = menuItemsArr[0]
                            as? [String: AnyObject] {
                                if let value: AnyObject = item0["value"] {
                                    print(value)
                                }
                        }
                    }
                }
            }
        }
    }
}

if let jsonDic = json as? NSDictionary,
   let menu = jsonDic["menu"] as? [String: AnyObject],
   let popup = menu["popup"],
   let popupDic = popup as? [String: AnyObject],
   let menuItems = popupDic["menuitem"],
   let menuItemsArr = menuItems as? [AnyObject],
   let item0 = menuItemsArr[0] as? [String: AnyObject],
      let value = item0["value"]
{
    print(value)
}

if let value = JSON(json)["menu"]["popup"]["menuitem"][0]["value"].string {
    print(value)
}

