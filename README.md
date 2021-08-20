## Go workfile tests - Product 

[ [Product](https://github.com/ohir/gwft), [App](https://github.com/ohir/gwft-app), [Protocol](https://github.com/ohir/gwft-protocol), [Client](https://github.com/ohir/gwft-client), [Server](https://github.com/ohir/gwft-server) ]

Set of modules to test [go workfile mode](https://github.com/golang/go/issues/45713) useability.
Workfile mode is developed by the Go Team and it has a natural skew toward monorepo workflows.


To install gotip and workspace aware branch:
```
go install golang.org/dl/gotip@latest
gotip download dev.cmdgo
```
---

This testing set of repos (gwft, gwft-app, gwft-protocol, gwft-server, gwft-client) aims to being the testbed (and a boilerplate later) for the FLOSS' and smaller than Google businesses workflows utilizing go.work file that is commited to the product (development) repository only, while all other pieces are separately go-gettable from respective subrepos.

Ie. only the umbrella repo (gwft) has `go.work` file and this file is meant to be checked in.  All subrepos under will provide separately versioned modules - including the `app` (command) module.


To install this (GWFT) development tree:

```
git clone --recursive --tags https://github.com/ohir/gwft.git
```

Now you can build app in either mode:

```
cd gwft/app
gotip -workfile=off build    # use modules
gotip build                  # use directories as set in gwft/go.work file
```

Note that this repo uses `example.com/` prefixed paths. You can change go.mod and git config to point to your github clone(s) issuing (in the gwft directory):

```
find . -name config -exec sed -ire "s#ohir/#yoursGH/#" {} \;
git submodule foreach 'sed -ire "s#ohir/#yoursGH/#g" go.mod'
```

The `depver` script is used to operate on subrepos versions in concert.
Just do `./depver` for usage help.

---
Notes:
Version v0.1.8 is last in the 0.1.x series that have individual replaces in respective go.mods.
Series v0.2.x move all replaces to the `go.work`

