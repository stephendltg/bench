# bench
Tools benchmark api &amp; endpoints 

**Deno**

```
deno install -f -A --unstable bombardierd.ts
```

```
bombardierd [flags] <url>

    --help                  Show context-sensitive help (also try --help-long
                            and --help-man).
    --version               Show application version.
-c, --connections=125       Maximum number of concurrent connections
-t, --timeout=2s            Socket/request timeout
-l, --latencies             Print latency statistics
-m, --method=GET            Request method
-b, --body=""               Request body
-f, --body-file=""          File to use as request body
-s, --stream                Specify whether to stream body using chunked
                            transfer encoding or to serve it from memory
    --cert=""               Path to the client's TLS Certificate
    --key=""                Path to the client's TLS Certificate Private Key
-k, --insecure              Controls whether a client verifies the server's
                            certificate chain and host name
-H, --header="K: V" ...     HTTP headers to use(can be repeated)
-n, --requests=[pos. int.]  Number of requests
-d, --duration=10s          Duration of test
-r, --rate=[pos. int.]      Rate limit in requests per second
    --fasthttp              Use fasthttp client
    --http1                 Use net/http client with forced HTTP/1.x
    --http2                 Use net/http client with enabled HTTP/2.0
-p, --print=<spec>          Specifies what to output. Comma-separated list of
                            values 'intro' (short: 'i'), 'progress' (short:
                            'p'), 'result' (short: 'r'). Examples:

                              * i,p,r (prints everything)
                              * intro,result (intro & result)
                              * r (result only)
                              * result (same as above)
-q, --no-print              Don't output anything
-o, --format=<spec>         Which format to use to output the result. <spec>
                            is either a name (or its shorthand) of some format
                            understood by bombardier or a path to the
                            user-defined template, which uses Go's
                            text/template syntax, prefixed with 'path:' string
                            (without single quotes), i.e.
                            "path:/some/path/to/your.template" or
                            "path:C:\some\path\to\your.template" in case of
                            Windows. Formats understood by bombardier are:

                              * plain-text (short: pt)
                              * json (short: j)

```

Example of running bombardier against this server:

```
> bombardier -c 125 -n 10000000 http://localhost:8080
Bombarding http://localhost:8080 with 10000000 requests using 125 connections
 10000000 / 10000000 [============================================] 100.00% 37s Done!
Statistics        Avg      Stdev        Max
  Reqs/sec    264560.00   10733.06     268434
  Latency      471.00us   522.34us    51.00ms
  HTTP codes:
    1xx - 0, 2xx - 10000000, 3xx - 0, 4xx - 0, 5xx - 0
    others - 0
  Throughput:   292.92MB/s
```

Or, against a realworld server(with latency distribution):

```
> bombardier -c 200 -d 10s -l http://ya.ru
Bombarding http://ya.ru for 10s using 200 connections
[=========================================================================] 10s Done!
Statistics        Avg      Stdev        Max
  Reqs/sec      6607.00     524.56       7109
  Latency       29.86ms     5.36ms   305.02ms
  Latency Distribution
     50%    28.00ms
     75%    32.00ms
     90%    34.00ms
     99%    48.00ms
  HTTP codes:
    1xx - 0, 2xx - 0, 3xx - 66561, 4xx - 0, 5xx - 0
    others - 5
  Errors:
    dialing to the given TCP address timed out - 5
  Throughput:     3.06MB/s
```
