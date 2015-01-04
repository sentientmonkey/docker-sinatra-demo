docker-sinatra-demo
===================

A simple sinatra app for demoing a docker setup.

Features:
* Uses bright box ppas for installing ruby
* Bundle installs prior to adding source (so it doesn't need to be added each time)
* Starts app with foreman
* Uses unicorn as webserver
* Runs as underprivledged user (not root)

See Dockfile for details
