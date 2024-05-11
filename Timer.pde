class Timer {
  int currTimeMillis;
  int totalTimeMillis;
  boolean isStarted;

  //Default Constructor: Assumes the Timer will run for 100
  Timer()
  {
    this(1);
  }

  Timer(int timeInSeconds) 
  {
    setTime(timeInSeconds);
    isStarted = false;
  }

  void start() 
  {
    currTimeMillis = millis(); 
    isStarted = true;
  }

  //Changes the duration of the timer
  void setTime(int timeInSeconds)
  {
    totalTimeMillis = timeInSeconds * 1000;
  }

  boolean isFinished() 
  { 
    int ellapsed = millis() - currTimeMillis;
    if (isStarted && ellapsed >= totalTimeMillis)
    {
      isStarted = false;
      return true;
    }
    return false;
  }

  int getTimeSeconds()
  {
    return totalTimeMillis / 1000;
  }

  int getTimeMilliseconds()
  {
    return totalTimeMillis;
  }
}
