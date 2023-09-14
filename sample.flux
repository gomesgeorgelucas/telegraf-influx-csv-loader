import "csv"
import "http/requests"

csv.from(csv: string(v: requests.get(url: "http://influx-apache/teste.csv").body), mode: "raw")
    |> map(fn: (r) => ({r with timestamp: time(v: int(v: r.timestamp))}))    
    |> to(bucket: "events", org: "influxorganization", timeColumn: "timestamp", measurementColumn: "device_id")