#ifndef STOPWATCHLINUX_H_
#define STOPWATCHLINUX_H_
#include <time.h>

class StopWatch
{
    struct timespec lastStartTime;

public:
    StopWatch();
    ~StopWatch(){}
    void start();
    double elapsedTime();
};

#endif /* STOPWATCHLINUX_H_ */
