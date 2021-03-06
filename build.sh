#!/bin/sh -x

BUILDDIR=./build
LATEST_TAG=`git describe --abbrev=0 --tags`

rm -rf ${BUILDDIR} && mkdir -p ${BUILDDIR}
gox -output="$BUILDDIR/{{.Dir}}_${LATEST_TAG}_{{.OS}}_{{.Arch}}" -os "linux darwin windows"

cd ${BUILDDIR}
for file in *
do
	mv $file sensible-proxy
	tar -zcvf "$file.tar.gz" "sensible-proxy"
	rm sensible-proxy
done

