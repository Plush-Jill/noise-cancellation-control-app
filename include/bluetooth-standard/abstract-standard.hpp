//
// Created by plush-jill on 6/20/25.
//

#ifndef ABSTRACT_STANDARD_HPP
#define ABSTRACT_STANDARD_HPP
#include "../noise-cancalletion-modes.hpp"
#include <string>

/**
 * @file abstract-standard.hpp
 * @brief Abstract class for Bluetooth standards, provide functions to switch noice cancellation modes that will be override in derived classes related to specific brand standards.
 *
 * This file defines the AbstractStandard class, which serves as a base class for all Bluetooth standard implementations.
 * It is intended to be inherited by specific standard classes that implement the required functionality.
 */
class AbstractStandard {
private:

public:
    AbstractStandard() = default;
    virtual ~AbstractStandard() = default;

    [[nodiscard]] virtual std::string getStandardName() const = 0;
    virtual void switchNoiceCancellationMode(NoiseCancellationMode mode) = 0;

};



#endif //ABSTRACT_STANDARD_HPP
