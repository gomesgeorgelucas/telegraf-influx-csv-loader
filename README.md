# telegraf-influx-csv-loader

# Read raw CSV to InfluxDB2 using Telegraf

https://docs.influxdata.com/telegraf/v1.27/data_formats/input/csv/

https://docs.influxdata.com/influxdb/cloud-serverless/write-data/csv/telegraf/#configure-telegraf-to-read-csv-files

https://docs.influxdata.com/flux/v0.x/stdlib/universe/time/

### sample flux

```js
import "csv"
import "http/requests"

csv.from(csv: string(v: requests.get(url: "http://influx-apache/teste.csv").body), mode: "raw")
    |> map(fn: (r) => ({r with timestamp: time(v: int(v: r.timestamp))}))
    |> to(bucket: "events", org: "influxorganization", timeColumn: "timestamp", measurementColumn: "device_id")

```
