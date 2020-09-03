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
# build the binary on your host (requires go)
$ ./build.sh
# in the vm - move the binary to a location where nomad can find it
$ ./install.sh
# run the server job
$ nomad job run|plan server.nomad
# inspect the job
$ nomad status server
# cleanup when done
$ vagrant destroy
```

# todos
- [x] run arbitrary binary w exec driver
- [x] scale out using dynamic ports
- [x] use artifact to fetch remote resource
- [ ] inspect cgroups for binary jobs
- [ ] try nomad alloc signal|exec
