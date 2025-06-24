//
// Created by plush-jill on 6/20/25.
//

#include "../include/bluetooth-manager.hpp"

bool BluetoothManager::isDeviceConnected(const QBluetoothDeviceInfo &device) const {
    QList<QBluetoothAddress> connectedDevices = m_local_bluetooth_device_.connectedDevices();
    for (const QBluetoothAddress &address : connectedDevices) {
        if (address == device.address()) {
            return true;
        }
    }
    return false;
}

BluetoothManager::BluetoothManager() {
    QBluetoothPermission bluetooth_permission {};
    qDebug() << "Bluetooth communication modes: " << bluetooth_permission.communicationModes();
    m_local_bluetooth_device_.setHostMode(QBluetoothLocalDevice::HostDiscoverable);


    if (!m_local_bluetooth_device_.isValid()) {
        qWarning("Bluetooth device is not valid.");
    } else {
        m_local_bluetooth_device_.powerOn();
        qDebug() << "Bluetooth device is valid and powered on.\nMAC Address:" << m_local_bluetooth_device_.address().toString();
    }
    connect(
        &m_device_discovery_agent_,
        &QBluetoothDeviceDiscoveryAgent::deviceDiscovered,
        this,
        &BluetoothManager::onDeviceDiscovered
    );
    findConnectedDevices();
}

void BluetoothManager::findConnectedDevices() {
    QObject::connect(
        &m_device_discovery_agent_,
        &QBluetoothDeviceDiscoveryAgent::deviceDiscovered,
        this,
        &BluetoothManager::onDeviceDiscovered
        );


    connect(
        &m_device_discovery_agent_,
        &QBluetoothDeviceDiscoveryAgent::finished,
        this,
        &BluetoothManager::onDiscoverEnd
    );

    m_device_discovery_agent_.start();
}

QStringList BluetoothManager::getConnectedDevices() const {
    return m_connected_device_names_;
}

void BluetoothManager::setMode(QString device_name, NoiseCancellationMode::Mode mode) {

}

void BluetoothManager::onDeviceDiscovered(const QBluetoothDeviceInfo &info) {
    if (
        // info.minorDeviceClass() == QBluetoothDeviceInfo::MinorAudioVideoClass::Headphones
        // &
        info.majorDeviceClass() == QBluetoothDeviceInfo::MajorDeviceClass::AudioVideoDevice
        &
        isDeviceConnected(info)
        &
        !m_connected_devices_.contains(info)
    ) {
        m_connected_devices_.append(info);
        qDebug() << "Headphones connected:" << info.name() << "Address:" << info.address().toString();
    }
    m_discovered_devices_cache_.insert(info.address(), info);
}

void BluetoothManager::onDiscoverEnd() const {
    qDebug() << "Device discovery finished. Total devices found: " << m_discovered_devices_cache_.size()
             << "\nConnected devices: " << m_connected_devices_.size();
}
