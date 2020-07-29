# SwiftDecoderEncoder
This is the easiest way to parse JSON object to a Swift.


JSON is a text-based data format that many webservices use . It’s superior to XML, because it’s efficient, easily parsed, and readable by humans. JSON is an agreed upon format for webservices, APIs and apps. It’s used throughout the web, apps, and online services, because the format is simple and flexible. So, as an iOS developer, you’ll come across JSON sooner rather than later.

How can you encode and decode JSON data to Swift objects effectively?

Before Swift 4, you’d have to serialize the JSON yourself, and then type cast every property of the JSON to the right Swift type.
Like this:

```swift
let json = try? JSONSerialization.jsonObject(with: data, options: [])

if let result = json as? [String: Any] {
    if let property = result["property"] as? Int {
        resultObject.yield = property
    }
}
```

Which was extremely verbose. Even though it works, it’s not ideal.Libraries like **SwiftyJSON** make working with JSON a lot easier, but you still need to map the JSON data to their respective Swift objects and properties.
With **Swift 4** and later you can now use the *Codable* protocol. Your Swift struct or class merely has to adopt that protocol, and you get JSON encoding and decoding for free.

In this project I’ve used nested types which are great general-purpose approach to complex JSON data structures. I’ve also used the **MVVM** Structure which arranged as below:
**Model:** Includes AppConstants, Country(sample model) and mapper function
**ViewModel:** Prepares URLRequest and Ask the NetworkManager to download data
**ViewController:** Get the mapped the data from ViewModel and update the data

Let’s take a look at the flow:
First from [www.rapidapi.com](https://rapidapi.com/apilayernet/api/rest-countries-v1) I’ve found some test api and JSON data. Then to decode the JSON to an actual Swift object, I’ve created a struct called Country. Like this:

```swift
// MARK: - CountryModel
struct Country: Codable {
    let name: String
    let topLevelDomain: [String]
    let alpha2Code, alpha3Code: String
    let callingCodes: [String]
    let capital: String
    let altSpellings: [String]
    let region, subregion: String
    let population: Int
    let latlng: [Int]
    let demonym: String
    let area: Int
    let gini: Double
    let timezones, borders: [String]
    let nativeName, numericCode: String
    let currencies, languages: [String]
    let translations: Translations
    let relevance: String
}

// MARK: - Translations
struct Translations: Codable {
    let de, es, fr, ja: String
    let it: String
}

typealias Response = [Country]
```
What I’ve done next, is decoding the JSON and turning it into a Country object at Mapper:

```swift
func mapp(jsString: String) -> Any {
}
```

**Easy, right? I’ve “mapped” the JSON object to a Swift struct, and decoded the JSON format to a native object Swift can work with.**
