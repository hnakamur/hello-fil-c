# hello-fil-c

You can [Install](https://fil-c.org/installation) and Try It Out Fil-C with Docker.

Install Fil-C and build hello.c and hello.cpp:

```
docker built -t filc .
```

Try running the built programs:

```
docker run --rm -it filc ./hello
```

```
docker run --rm -it filc ./hello-cpp
```
