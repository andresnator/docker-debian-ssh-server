# Image docker debian ssh server

## Steps
1. build *ssh-keygen*
2. build image

### build ssh-keygen
`ssh-keygen -f remote_key`

### build image
`docker build --build-arg USER=username --build-arg PASS=password -t name-image .` 
