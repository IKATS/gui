# IKATS gui

Front nginx server that handles the following roles:

* Reverse proxy to reach internal services (datamodel, pybase, opentsdb) from the GUI without exposing them
* Serve the GUI