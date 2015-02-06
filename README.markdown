# Tracelytics Docker

Dockerfile for building the tracelytics daemons in docker

1. Clone this repo
2. Change both `appneta.list` and `tracelytics.conf` to use your access key
3. Run `docker build -t tracelytics .` in the current folder
4. Run with `docker run tracelytics`
5. Use fig or the docker CLI to link another container to this one (needs linking and volumes-from; ex: [here](https://github.com/tlunter/amtrak_endpoint/blob/master/fig.yml))

Feel free to give me some feedback!
