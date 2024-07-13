# PDAL Debian Package (unofficial)

PDAL was available as [Bullseye Debian package](https://packages.debian.org/bullseye/pdal) but has been unavailable since. This project aims at re-creating the package for current Debian releases, officially or unofficially.


## State of this project

- there is no Debian package build yet, and no control file for that yet
- we are at the proof-of-build stage, finding out whether the upstream project can be built on Debian, and what dependency that takes
- currently the proof-of-build is failing, so some lines in the Dockerfile are disabled for further debugging


## Proof-of-build

Given a specific version of PDAL and a specific Debian release,
there is a Dockerfile with all dependencies and build steps:

`buildah bud -f PDAL-2.7.2-bookworm.Dockerfile`


### If something fails

If the Dockerfile build fails, comment out the the failing step
and all lines below in the Dockerfile, rerun it, and the enter
the container to debug manually:

```
podman run --rm -it <TAG or HASH>
```


### If a test fails

Enter the container and rerun the failing test manually. PDAL uses googletest,
so you can rerun all the tests manually on the command line, with all the options
of the googletest runner are available.

E.g. if during the build you see:

```
106/131 Test #106: pdal_filters_shell_test ......................***Failed    0.08 sec
```

the failing test is `pdal_filters_shell_test`, so you would then execute, in the container in the work directory `/PDAL/`:

```
./build/bin/pdal_filters_shell_test
```