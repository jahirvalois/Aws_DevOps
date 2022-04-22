root
2 cpus
1.5 gb ram



172.17.0.26
172.17.0.0/16
host dwp.gov.uk | grep "has address" | sed 's/has address/-/g'
host -t a dwp.gov.uk    
    151.101.2.30
dig dwp.gov.uk MX +short
    10 mx2.hc1011-45.c3c2.iphmx.com
    10 mx1.hc1011-45.c3c2.iphmx.com

    
nameserver 127.0.0.53 options edns0 trust-ad



openssl s_client -showcerts -connect bbc.co.uk:443 </dev/null | sed -n -e '/-.BEGIN/,/-.END/ p' > certifs.pem
openssl s_client -servername bbc.co.uk -connect bbc.co.uk:443 | openssl x509 -noout -dates
openssl s_client -connect bbc.co.uk:443 </dev/null 2>/dev/null | openssl x509 -noout -text | grep DNS:
openssl s_client -servername bbc.co.uk -connect bbc.co.uk:443 2>/dev/null | openssl x509 -noout -issuer