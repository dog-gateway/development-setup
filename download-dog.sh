#!/bin/sh
while getopts u:p:sda option
do
case "${option}" in
u) USER=${OPTARG};;
p) PASSWORD=${OPTARG};;
s) SEMANTIC=1;;
d) DRIVERS=1;;
a) ADDONS=1;;
esac
done

# prepare top folders
mkdir addons
mkdir admin
mkdir communication
mkdir configurations
mkdir core
mkdir dependencies
mkdir documentation
mkdir drivers

# core repositories
cd core
git clone https://$USER:$PASSWORD@github.com/dog-gateway/clock.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/console-log.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/core-library.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/device-factory.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/device-manager.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/jaxb-library.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/measure-library.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/monitor-admin.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/rxtx.git

if ((!SEMANTIC)); then
    # not-semantic (default)
    git clone https://$USER:$PASSWORD@github.com/dog-gateway/simple-house-model.git
fi

if ((SEMANTIC)); then
    # semantic
    git clone https://$USER:$PASSWORD@github.com/dog-gateway/hermit-osgi.git
    git clone https://$USER:$PASSWORD@github.com/dog-gateway/semantic-house-model.git
    git clone https://$USER:$PASSWORD@github.com/dog-gateway/semantic-library.git
fi

# stream processing
git clone https://$USER:$PASSWORD@github.com/dog-gateway/stream-library.git

# return to the original root folder
cd ..
# end core repositories

# core dependencies
cd dependencies
mkdir core
cd core
git clone https://$USER:$PASSWORD@github.com/dog-gateway/felix-dependencies.git

if ((SEMANTIC)); then
    git clone https://$USER:$PASSWORD@github.com/dog-gateway/semantic-dependencies.git
fi

cd ..
cd ..
# end core dependencies

# drivers
if ((DRIVERS)); then
cd drivers

# bluetooth
mkdir bluetooth
cd bluetooth
git clone https://$USER:$PASSWORD@github.com/dog-gateway/bluetooth-drivers.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/bluetooth-library.git
cd ..

# bticino
mkdir bticino
cd bticino
git clone https://$USER:$PASSWORD@github.com/dog-gateway/bticino-drivers.git
cd ..


# enocean
mkdir enocean
cd enocean
git clone https://$USER:$PASSWORD@github.com/dog-gateway/enocean-drivers.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/enj-library.git
cd ..

# hue
mkdir hue
cd hue
git clone https://$USER:$PASSWORD@github.com/dog-gateway/hue-drivers.git
cd ..

# KNX
mkdir knx
cd knx
git clone https://$USER:$PASSWORD@github.com/dog-gateway/knx-drivers.git
cd ..

# modbus
mkdir modbus
cd modbus
git clone https://$USER:$PASSWORD@github.com/dog-gateway/modbus-drivers.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/jamod-rtu-over-tcp.git
cd ..

# plugwise
mkdir plugwise
cd plugwise
git clone https://$USER:$PASSWORD@github.com/dog-gateway/plugwise-over-mqtt-drivers.git
# plugwise requires MQTT addons

cd ..

# virtual appliances
mkdir virtualappliances
cd virtualappliances
git clone https://$USER:$PASSWORD@github.com/dog-gateway/virtualappliances.git
cd ..

# z-wave
mkdir z-wave
cd z-wave
git clone https://$USER:$PASSWORD@github.com/dog-gateway/zwave-drivers.git
cd ..

# zigbee - not so stable - excluded for now
#mkdir zigbee
#cd zigbee
#git clone https://$USER:$PASSWORD@github.com/dog-gateway/zigbee-drivers.git
#cd ..
cd ..
# end drivers

# drivers dependencies
cd dependencies
mkdir drivers
cd drivers
mkdir virtualappliances
cd virtualappliances
git clone https://$USER:$PASSWORD@github.com/dog-gateway/virtualappliances-dependencies.git
cd ..
cd ..
cd ..
#mkdir zigbee
#git clone https://$USER:$PASSWORD@github.com/dog-gateway/jemma-for-dog.git
#cd..

#plugwise needs mqtt
cd addons
git clone https://$USER:$PASSWORD@github.com/dog-gateway/mqtt.git
cd ..

fi
# end drivers

# addons
if ((ADDONS)); then
cd addons
git clone https://$USER:$PASSWORD@github.com/dog-gateway/h2-eventstore.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/mqtt.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/org.doggateway.addons.upnp.advertizer.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/xbmc-notifier-addon.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/rule-engine.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/stream-processor.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/simple-stream-processor.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/xively.git
cd ..
cd dependencies
mkdir addons
cd addons
git clone https://$USER:$PASSWORD@github.com/jomarmar/cling-osgi.git
cd ..
cd ..
fi
# end addons

# admin
cd admin
git clone https://$USER:$PASSWORD@github.com/dog-gateway/adminui.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/system-management.git
cd ..

# communication
cd communication
git clone https://$USER:$PASSWORD@github.com/dog-gateway/device-api.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/environment-api.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/websocket-connector.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/websocket-environment-api.git
git clone https://$USER:$PASSWORD@github.com/dog-gateway/websocket-device-api.git

if ((ADDONS)); then
    git clone https://$USER:$PASSWORD@github.com/dog-gateway/history-api.git
    git clone https://$USER:$PASSWORD@github.com/dog-gateway/rule-engine-api.git
fi
cd ..

# communication dependencies
cd dependencies
mkdir rest
cd rest
git clone https://$USER:$PASSWORD@github.com/dog-gateway/rest-dependencies.git
cd ..
mkdir websocket
cd websocket
git clone https://$USER:$PASSWORD@github.com/dog-gateway/websocket-dependencies.git
cd ..
cd ..
# end communication

# documentation
cd documentation
git clone https://$USER:$PASSWORD@github.com/dog-gateway/rest-api-docs.git
cd ..

# deployment
mkdir deploy
cd deploy
git clone https://$USER:$PASSWORD@github.com/dog-gateway/standalone-version.git
cd ..


