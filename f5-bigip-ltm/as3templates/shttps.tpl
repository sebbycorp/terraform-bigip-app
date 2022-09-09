{
  "class": "AS3",
  "action": "deploy",
  "persist": true,
  "declaration": {
    "class": "ADC",
    "schemaVersion": "3.0.0",
    "id": "${DESCRIPTION}",
    "label": "${DESCRIPTION}",
    "remark": "${DESCRIPTION}",
    "${TENANT}": {
      "class": "Tenant",
      "${DESCRIPTION}": {
        "class": "Application",
        "service": {
          "class": "Service_HTTPS",
          "virtualAddresses": [
             "${VIP_ADDRESS}"
          ],
          "pool": "${POOL_NAME}",
          "profileTCP": {
            "use": "${TCP_PROFILE}"
          },
          "persistenceMethods": [{
            "use": "${PERSISTENCE}"
          }],
          "profileHTTP": {
            "use": "${HTTP_PROFILE}"
          },
          "serverTLS": "${SSL_PROFILE}",
          "clientTLS": {
            "bigip":"/Common/serverssl"
            }
        },
        "${PERSISTENCE}":{
          "class": "Persist",
          "persistenceMethod": "${PERSISTENCEMETHOD}",
          "cookieName": "${DESCRIPTION}"
        },
        "${POOL_NAME}": {
          "class": "Pool",
          "loadBalancingMode": "${LOADBALANCEMODE}",
          "monitors": [
            "${MONITOR}"
          ],
          "members": [{
            "servicePort": ${POOLMEMBERS_PORT},
            "shareNodes": true,
            "serverAddresses": ${MY_POOLMEMBERS}
          }]
        },
        "${TCP_PROFILE}": {
          "class": "TCP_Profile",
          "idleTimeout": 300,
          "closeWaitTimeout": 5
        },
        "${HTTP_PROFILE}": {
          "class": "HTTP_Profile",
          "xForwardedFor": true
        },
        "${SSL_PROFILE}": {
          "class": "TLS_Server",
          "certificates": [{
            "certificate": "${TLS_CERT}"
          }]
        },
        "${TLS_CERT}": {
          "class": "Certificate",
          "remark": "in practice we recommend using a passphrase",
          "certificate": ${CERT},
          "privateKey": ${KEY},
          "chainCA": ${CA_CHAIN}
        }
      }
    }
  }
}