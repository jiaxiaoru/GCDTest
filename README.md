# GCDTest
Seriel/concurrent/async/syn

串行异步	开辟新线程

串行同步	不开辟新线程

并行同步	不开辟新线程

并行异步	开辟新线程

主队列(dispatch_get_main_queue()):供主线程调度,是串行队列

全局队列(dispatch_get_global_queue(0, 0)):是并行队列 

**主队列串行会死锁**

想要知道原因 看wiki
