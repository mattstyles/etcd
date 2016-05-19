
# Container running etcd version 2.2.3

Matches etcd version with current coreos stable version.

```sh
docker pull personalurban/etcd
```

You’ll need to pass in your host ip as an environment variable so that
`etcd` will bootstrap correctly

```sh
docker run -d --name etcd -e HOST_IP="x.x.x.x" -p 2379:2379 personalurban/etcd
```

`etcd` is run as an entry point so you’re free to add whatever arguments
you like to the `run` command

```sh
docker run -d --name etcd -e HOST_IP="x.x.x.x" -p 2379:2379 personalurban/etcd --name kv
```

`etcdctl` is included

```sh
docker exec etcd etcdctl ls --recursive
```

