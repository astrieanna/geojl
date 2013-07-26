module GeoCoderUs
  include("geocommon.jl")
  using HTTPClient.HTTPC
  base_url = "http://rpc.geocoder.us/service" 

  type GeoCoderClient
    username::String
    password::String
  end

  function geocode(location::String)
    resp = HTTPC.get("$base_url/csv",
                    RequestOptions(;query_params=[("address",location)]))
    return resp.body 
  end

  function simple_geocode(location::String)
    csv = geocode(location)

    parts = split(strip(csv),",",3) 
    lat = float(parts[1])
    lng = float(parts[2])
    place = parts[3]
    return GeoCommon.SimpleLocation(place,lat,lng)
  end

end
