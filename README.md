# ansible_role_kubernetes_setup

This is an Ansible role. This role executes the setting of constructed Kubernetes environment.

## Processing
This role executes the following settings.

* kubectl setting
  * set used cluster
  * set used context
* dashboard setting
  * deploy dashboard

## Caution!!
* This role assumpts Kubernetes environment is already constructed.

## Support OS

| OS | version |
|----|---------|
|CentOS|7|

## Role variables
```
kubernetes_setup:
  master:
    ip: 192.168.1.115               # ip of master node
    api_port: 8080                  # listen port of api server
  kubectl:
    cluster_name: default-cluster   # cluster used by kubectl
    context:                        # context used by kubectl
      name: default-context         # name of context
      user: default-admin           # user specified in context
      namespace: default-namespace  # namespace specified in context
```

## Dependencies
None

## Build status
|branch|status|
|------|------|
|master|[![Build Status](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_kubernetes_setup_master/badge/icon)](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_kubernetes_setup_master/)|
|v.0.1 |[![Build Status](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_kubernetes_setup_v.0.1/badge/icon)](http://jenkins.bbrfkr.mydns.jp:8088/job/ansible_role_kubernetes_setup_v.0.1/)|

## Retest
This role is tested by serverspec, then its test codes are included in repository. Users can retest this role by using the test codes. To retest this role, follow the steps described below.

1. Prepare 1 target (Here, target ip is X.X.X.X)
2. Install serverspec in local machine
3. Modify spec/inventory.yml
```
---
- conn_name: target15  # never change!
  conn_host: X.X.X.X   # target ip
  conn_port: 22        # target's ssh port
  conn_user: vagrant   # user to connect
  conn_pass: vagrant   # password of user
  conn_idkey:          # path of identity key 
                       # (absolute path or relative path from the location of Rakefile)
  sudo_pass:           # sudo password of user
```

4. Modify targets ips in any files of `spec` dir
```
$ sed -i 's/192\.168\.1\.115/X.X.X.X/g' `find spec -type f`
```

5. Run `rake`

## License
MIT

## Author
Name: bbrfkr  
MAIL: bbrfkr@gmail.com

