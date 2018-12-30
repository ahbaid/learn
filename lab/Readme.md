# Lab scripts

## alias-hosts.sh
### mssh 
- Used to alias lab IPs in /etc/hosts
- entries must match 198.?.?.? hostname shortcut
- typically "ip hostname shortname" using periodic tale atomic weights for ip, host and shortname
- for example "198.1.1.29 copper cu"

```
ahbaidg$ mssh ca

unable to ssh, no suitable single match found....

198.1.1.20 calcium ca
198.1.1.21 scandium sc

ahbaidg$ mdesc ca
198.1.1.20 calcium ca
198.1.1.21 scandium sc
ahbaidg$ mdesc cu
198.1.1.29 copper cu
ahbaidg$ mssh cu
ssh to 198.1.1.29
```
