# noise-cancellation-control-app
### Application with GUI for control noise cancellation modes on bluetooth headphones.

## Development in progress...
I want to develop an application for controlling noise cancellation modes on headphones that will support a variety of devices from different brands.
It would be easier to set modes from PC instead of pressing the buttons on the headphones.

### Progress:
- Basic GUI with QML
- Have a problem with reverse engineering of the bluetooth protocol, need root access on Android


### Requirements:
- Qt 6

### Build:
```bash
mkdir build
cd build
cmake ..
cmake --build .
```

### Run:
```bash
./build/NCC-App.exe
```