//
// Created by plush-jill on 6/20/25.
//

#ifndef NOISE_CANCELLATION_MODE_HPP
#define NOISE_CANCELLATION_MODE_HPP
#include <QObject>
class NoiseCancellationMode : public QObject {
    Q_OBJECT

public:
    enum Mode {
        On,
        Off,
        Ambient,
    };
    Q_ENUM(Mode)
};


#endif //NOISE_CANCELLATION_MODE_HPP
