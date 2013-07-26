geojl
=====

A wrapper for making API requests to some geocoding APIs.
I'm modeling it on Python's [geopy](https://github.com/geopy/geopy).

## Example of MapQuest:

    julia> using geojl

    julia> cl = MapQuest.MapQuestClient("Fmjtd|luub200znl,7l=o5-9ur0du")
    MapQuestClient("Fmjtd|luub200znl,7l=o5-9ur0du")

    julia> MapQuest.geocode(cl,"University of Oregon, Eugene, OR")
    ["results"=>{["locations"=>{["sideOfStreet"=>"N","adminArea3Type"=>"State","mapUrl"=>"http://www.mapquestapi.com/staticmap/v4/getmap?key=Fmjtd|luub200znl,7l=o5-9ur0du&type=map&size=225,160&pois=purple-1,44.045505,-123.071865,0,0|&center=44.045505,-123.071865&zoom=15&rand=-936240298","dragPoint"=>false,"street"=>"[1-3180] University of Oregon","adminArea3"=>"OR","displayLatLng"=>["lng"=>-123.071865,"lat"=>44.045505],"linkId"=>0,"postalCode"=>"97403","adminArea1"=>"US","geocodeQualityCode"=>"B1AAA","latLng"=>["lng"=>-123.071865,"lat"=>44.045505],"adminArea5"=>"Eugene","adminArea4"=>"Lane County","adminArea1Type"=>"Country","adminArea5Type"=>"City","adminArea4Type"=>"County","type"=>"s","geocodeQuality"=>"STREET"],["sideOfStreet"=>"N","adminArea3Type"=>"State","mapUrl"=>"http://www.mapquestapi.com/staticmap/v4/getmap?key=Fmjtd|luub200znl,7l=o5-9ur0du&type=map&size=225,160&pois=purple-2,44.04551,-123.070315,0,0|&center=44.04551,-123.070315&zoom=15&rand=-936240298","dragPoint"=>false,"street"=>"[3181-5299] University of Oregon","adminArea3"=>"OR","displayLatLng"=>["lng"=>-123.070315,"lat"=>44.04551],"linkId"=>0,"postalCode"=>"97403","adminArea1"=>"US","geocodeQualityCode"=>"B1AAA","latLng"=>["lng"=>-123.070315,"lat"=>44.04551],"adminArea5"=>"Eugene","adminArea4"=>"Lane County","adminArea1Type"=>"Country","adminArea5Type"=>"City","adminArea4Type"=>"County","type"=>"s","geocodeQuality"=>"STREET"]},"providedLocation"=>["location"=>"University of Oregon, Eugene, OR"]]},"info"=>["messages"=>{},"statuscode"=>0,"copyright"=>["text"=>"© 2013 MapQuest, Inc.","imageAltText"=>"© 2013 MapQuest, Inc.","imageUrl"=>"http://api.mqcdn.com/res/mqlogo.gif"]],"options"=>["ignoreLatLngInput"=>false,"thumbMaps"=>true,"maxResults"=>-1]]

    julia> MapQuest.simple_geocode(cl,"University of Oregon, Eugene, OR")
    SimpleLocation("Eugene, Lane County, OR, US",44.045505,-123.071865)

## Example of geocoder.us:

    julia> using geojl

    julia> GeoCoderUs.geocode("Pennsylvania Ave, Washington DC")
    "2: couldn't find this address! sorry"

    julia> GeoCoderUs.geocode("1600 Pennsylvania Ave, Washington DC")
    "38.898748,-77.037684,1600 Pennsylvania Ave NW,Washington,DC,20502\n"

    julia> GeoCoderUs.simple_geocode("1600 Pennsylvania Ave, Washington DC")
    SimpleLocation("1600 Pennsylvania Ave NW,Washington,DC,20502",38.898748,-77.037684)
