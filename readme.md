# nomad lab
Testing the nomad orchestrator by running some things

# requirements
- virtualbox
- go

# usage
This dir is synched to `/vagrant` in the vm
```bash
# run vagrant
$ vagrant up && vagrant ssh
# start nomad
$ sudo nomad agent -dev | grep ERROR
# run the server job
$ nomad job run server.nomad
# inspect the job
$ nomad status server
# cleanup when done
$ vagrant destroy
```

# new release
```bash
# 1. Build-, and package the binary on your host (requires go)
$ ./build.sh
# 2. commit and tag changes and make a new release on github
# 3. update source and checksum in server.nomad
```

# todos
- [x] run arbitrary binary w exec driver
- [x] scale out using dynamic ports
- [x] use artifact to fetch remote resource
- [ ] inspect cgroups for binary jobs
- [ ] try nomad alloc signal|exec
