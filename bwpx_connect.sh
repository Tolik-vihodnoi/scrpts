#!/bin/bash

if ! command -v bluetoothctl &> /dev/null
then
    echo "Утилита bluetoothctl не найдена"
    exit 0
fi

DEVICE_NAME="Bowers & Wilkins PX"

if ! bluetoothctl show | grep -q "Powered: yes"
then
    echo "Bluetooth-адаптер выключен"
    exit 0
fi

DEVICE_ID=$(bluetoothctl devices | grep "$DEVICE_NAME" | awk '{print $2}')
if [ -z "$DEVICE_ID" ]
then
    echo "Устройство $DEVICE_NAME не найдено"
    exit 0
fi

bluetoothctl connect "$DEVICE_ID"
