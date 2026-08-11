## References

- [Linux Device Drivers, Third Edition - LWN.net](https://lwn.net/Kernel/LDD3/)
- 
## Character devices

They're just named kernel APIs.

## Tracepoints

- [Using the Linux Kernel Tracepoints — The Linux Kernel documentation](https://www.kernel.org/doc/html/latest/trace/tracepoints.html)

### Tracepoints exposed by kernel

```sh
cat /proc/kallsyms | grep __tracepoint_
```

### Tracepoints definition

To find the tracepoint definition:

```sh
grep -A 10 -B 10 -n "sched_process_for" /usr/src/linux-headers-$(uname -r)/include/trace/events/sched.h
```

> [!QUESTION] HOW TO FIND OUT HOW THE SUBSYSTEM AND EVENT ARE CALLED?

