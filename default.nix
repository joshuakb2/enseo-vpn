{ bash, openconnect-sso, writeScriptBin }:

writeScriptBin "enseo-vpn" ''
  #!${bash}/bin/bash
  OPENSSL_CONF=${./ssl.conf} ${openconnect-sso}/bin/openconnect-sso --server vpn.enseo.com --authgroup Enseo-Entra
''
