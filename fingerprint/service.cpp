/*
 * Copyright (C) 2017 The Android Open Source Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "android.hardware.biometrics.fingerprint@2.3-service.mt6768"

#include <android/log.h>
#include <hidl/HidlSupport.h>
#include <hidl/HidlTransportSupport.h>
#include <android/hardware/biometrics/fingerprint/2.2/types.h>
#include <android/hardware/biometrics/fingerprint/2.3/IBiometricsFingerprint.h>
#include "BiometricsFingerprint.h"

using android::hardware::biometrics::fingerprint::V2_3::IBiometricsFingerprint;
using android::hardware::biometrics::fingerprint::V2_3::implementation::BiometricsFingerprint;
using android::hardware::configureRpcThreadpool;
using android::hardware::joinRpcThreadpool;
using android::hardware::setMinSchedulerPolicy;
using android::sp;

int main() {
    android::sp<IBiometricsFingerprint> bio = BiometricsFingerprint::getInstance();

    configureRpcThreadpool(1, true /*callerWillJoin*/);
    setMinSchedulerPolicy(bio, SCHED_NORMAL, -20);

    if (bio != nullptr) {
        if (::android::OK != bio->registerAsService()) {
            return 1;
        }
    } else {
        ALOGE("Can't create instance of BiometricsFingerprint, nullptr");
    }

    joinRpcThreadpool();

    return 0; // should never get here
}
