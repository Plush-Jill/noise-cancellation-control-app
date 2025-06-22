//
// Created by plush-jill on 6/20/25.
//

#ifndef BLUETOOTH_MANAGER_HPP
#define BLUETOOTH_MANAGER_HPP
#include <QtBluetooth/QtBluetooth>


class BluetoothManager final : public QObject {
    Q_OBJECT

private:
    /**
     * @brief Bluetooth device on user PC.
     */
    QBluetoothLocalDevice m_local_bluetooth_device_ {};
    QBluetoothDeviceDiscoveryAgent m_device_discovery_agent_ {};
    QHash<QBluetoothAddress, QBluetoothDeviceInfo> m_discovered_devices_cache_;
    QList<QBluetoothDeviceInfo> m_connected_devices_;

    /**
     * @brief List of discovered Bluetooth devices.
     * @arg First QString: Device name.
     * @arg Second QString: Protocol standard name.
     */
    QMap<QString, QString> m_device_standards_;

    [[nodiscard]] bool isDeviceConnected(const QBluetoothDeviceInfo &device) const;


public:
    BluetoothManager();
    ~BluetoothManager() override = default;
    void findConnectedDevices();

public slots:
    /**
     * @brief Slot called when a new Bluetooth device is discovered.
     * @param info Information about the discovered device
     */
    void onDeviceDiscovered(const QBluetoothDeviceInfo& info);
    void onDiscoverEnd() const;
};



#endif //BLUETOOTH_MANAGER_HPP
