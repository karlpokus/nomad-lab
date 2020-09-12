# nomad lab
Testing the nomad orchestrator by running some things

# requirements
- virtualbox
- go

# usage

Single nomad agent on single host

```bash
# run vagrant
$ vagrant up && vagrant ssh
# start nomad
$ sudo nomad agent -dev | grep ERROR
# run the server job in /vagrant
$ nomad job run server.nomad
# inspect the job
$ nomad status server
# cleanup when done
$ vagrant destroy
```

Nomad cluster on single host

```bash
$ mkdir -p /tmp/{server1,client1,client2}
$ cd /vagrant
$ nohup nomad agent -config conf/server.hcl | grep ERROR > log/server.log &
$ nohup sudo nomad agent -config conf/client1.hcl | grep ERROR > log/client1.log &
$ nohup sudo nomad agent -config conf/client2.hcl | grep ERROR > log/client2.log &
$ tail -f log/*
```

# new server release
```bash
# 1. Build-, and package the binaries on your host (requires go)
$ ./build.sh
# 2. commit and tag changes and make a new release on github
# 3. update source and checksum in *.nomad
```

# todos
- [x] run arbitrary binary w exec driver
- [x] scale out using dynamic ports
- [x] use artifact to fetch remote resource
- [x] nomad agent cluster
- [ ] inspect cgroups for binary jobs
- [ ] try nomad alloc signal|exec
- [ ] disaster recovery
- [ ] try bridge network
- [x] register service w consul
- [x] service discovery w consul
- [ ] add checksum to build step
