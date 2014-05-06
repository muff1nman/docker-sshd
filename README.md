Usage
-----
as root:
```
ssh-keygen

docker run -d -v /root/.ssh:/root/.ssh -p 2222:22

ssh -p 2222 localhost
```

As a Base Image
---------------
Copy the supervisor conf file and add your own entries for starting up your own
processes but make sure to leave the sshd entry
in tact. Also be sure not to override `CMD` or if you do, ensure that
`supverisord` gets started.

Security Concerns
-----------------
To make this image easy to use, while skirting around permission issues in
docker, some security was sacrificed. The issue is that your root private key
will now be exposed to the container. To avoid any issues with this, dont use
your root private key and disallow root logins for your host machine in your
`sshd_config`  -- not an ideal solution, but the price of using docker before
prime time.


