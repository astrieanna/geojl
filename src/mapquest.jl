module MapQuest
  include("geocommon.jl")
  using HTTPClient.HTTPC
  using JSON

  base_url = "http://www.mapquestapi.com/geocoding/v1/address"

  type MapQuestClient
    key::String
  end

  function geocode(mq::MapQuestClient, location::String)
    resp = get(base_url,
               HTTPC.RequestOptions(;query_params=
                 [("key",mq.key),("location",location)]))
    json = JSON.parse(resp.body)
    return json
  end

  function simple_geocode(mq::MapQuestClient, location::String)
    result = geocode(mq,location)
    country = result["results"][1]["locations"][1]["adminArea1"]
    state   = result["results"][1]["locations"][1]["adminArea3"]
    county  = result["results"][1]["locations"][1]["adminArea4"]
    city    = result["results"][1]["locations"][1]["adminArea5"]
    lat     = result["results"][1]["locations"][1]["latLng"]["lat"]
    lng     = result["results"][1]["locations"][1]["latLng"]["lng"]
    GeoCommon.SimpleLocation("$city, $county, $state, $country",lat,lng)
  end

end
