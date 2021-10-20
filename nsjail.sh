export START=$(pwd)

$NSJAIL \
    --cwd=$(pwd) \
    --chroot=/ \
    --rw \
    --rlimit_as=soft \
    --rlimit_fsize=soft \
    --keep_env \
    --keep_cap \
    -- \
    /bin/bash -c "cd $START && $*"
