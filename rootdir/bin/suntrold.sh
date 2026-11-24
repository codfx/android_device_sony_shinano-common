#!/vendor/bin/sh

# Start suntrold
/vendor/bin/suntrold

# Sleep infinite to prevent that suntrold's subprocess gets killed.
# Not "tail -f /dev/null": on the 3.4 kernel an inotify read returns EINTR when the
# suspend freezer runs, so tail exited with status 1 and init restarted the service,
# killing the daemon, on every suspend attempt. sleep restarts transparently after the
# freezer, and the loop covers any early return.
while :; do sleep 86400; done
