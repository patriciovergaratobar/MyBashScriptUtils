echo "Inicio de Active MQ"
docker run --name='activemq' -d -e 'ACTIVEMQ_CONFIG_NAME=amqp-srv1' -e 'ACTIVEMQ_CONFIG_DEFAULTACCOUNT=false' -e 'ACTIVEMQ_ADMIN_LOGIN=admin' -e 'ACTIVEMQ_ADMIN_PASSWORD=admin' -v /data/activemq:/data -v /var/log/activemq:/var/log/activemq -p 8161:8161 -p 1883:1883 -p 5672:5672 -p 61616:61616 -p 61613:61613 webcenter/activemq
