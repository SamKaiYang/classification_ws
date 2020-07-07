#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/iclab/Documents/classification_ws/src/rs_d435i/get_rs_image"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/iclab/Documents/classification_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/iclab/Documents/classification_ws/install/lib/python2.7/dist-packages:/home/iclab/Documents/classification_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/iclab/Documents/classification_ws/build" \
    "/usr/bin/python2" \
    "/home/iclab/Documents/classification_ws/src/rs_d435i/get_rs_image/setup.py" \
     \
    build --build-base "/home/iclab/Documents/classification_ws/build/rs_d435i/get_rs_image" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/iclab/Documents/classification_ws/install" --install-scripts="/home/iclab/Documents/classification_ws/install/bin"
