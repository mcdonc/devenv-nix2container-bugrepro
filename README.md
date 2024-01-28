Smallest possible reproduction of the bug described at
https://github.com/nlewo/nix2container/issues/112 .

To repro:

1. Remove any traces of devenv from your nix profiles.

2. Install the python-rewrite branch of Nix in a profile

```
   $ nix profile install github:cachix/devenv/python-rewrite
```
3. Check this repository out and cd'ed within it do

```
   $ devenv shell
   $ devenv container shell --docker-run
```

The result will be something like:

```
FATA[0005] committing the finished image: docker engine reported: mkdir /nix/store: too many levels of symbolic links 
✖ Copying shell container in 14.7s.
Traceback (most recent call last):
  File "/nix/store/l1m1i989pmw37an9rq7pp77kg6zakqrz-python3.11-devenv-1.0/bin/.devenv-wrapped", line 9, in <module>
    sys.exit(cli())
             ^^^^^
  File "/nix/store/q85kg00zk53a2i0355v0qczhvid3nq92-python3.11-click-8.1.6/lib/python3.11/site-packages/click/core.py", line 1157, in __call__
    return self.main(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/nix/store/q85kg00zk53a2i0355v0qczhvid3nq92-python3.11-click-8.1.6/lib/python3.11/site-packages/click/core.py", line 1078, in main
    rv = self.invoke(ctx)
         ^^^^^^^^^^^^^^^^
  File "/nix/store/q85kg00zk53a2i0355v0qczhvid3nq92-python3.11-click-8.1.6/lib/python3.11/site-packages/click/core.py", line 1688, in invoke
    return _process_result(sub_ctx.command.invoke(sub_ctx))
                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/nix/store/q85kg00zk53a2i0355v0qczhvid3nq92-python3.11-click-8.1.6/lib/python3.11/site-packages/click/core.py", line 1434, in invoke
    return ctx.invoke(self.callback, **ctx.params)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/nix/store/q85kg00zk53a2i0355v0qczhvid3nq92-python3.11-click-8.1.6/lib/python3.11/site-packages/click/core.py", line 783, in invoke
    return __callback(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/nix/store/q85kg00zk53a2i0355v0qczhvid3nq92-python3.11-click-8.1.6/lib/python3.11/site-packages/click/decorators.py", line 33, in new_func
    return f(get_current_context(), *args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/nix/store/l1m1i989pmw37an9rq7pp77kg6zakqrz-python3.11-devenv-1.0/lib/python3.11/site-packages/devenv/cli.py", line 514, in container
    subprocess.run(
  File "/nix/store/cl6bxs1bad3bbw6fhhrvdq1vlihqjqqg-python3-3.11.4/lib/python3.11/subprocess.py", line 571, in run
    raise CalledProcessError(retcode, process.args,
subprocess.CalledProcessError: Command '/nix/store/szadb18l8qjy0361w0fx23a3pczpaw43-copy-container /nix/store/9zyy7gfs8c1zb93h0xzzj8vc66qrcgbp-image-shell.json docker-daemon: ' returned non-zero exit status 1.
```
