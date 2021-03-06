[![Build Status](https://travis-ci.org/justinj/reconstruction-database.png?branch=master)](https://travis-ci.org/justinj/reconstruction-database)
[![Code Climate](https://codeclimate.com/github/justinj/reconstruction-database.png)](https://codeclimate.com/github/justinj/reconstruction-database)

<p align="center">
  <img src="https://raw.github.com/justinj/reconstruction-database/master/public/images/logo.png">
</p>

RCDB
====

RCDB is a <b>R</b>e<b>c</b>onstruction <b>D</b>ata<b>b</b>ase.
The goal is to document and categorize reconstructions of important or interesting solves of the Rubik's Cube and related puzzles,
for both educational and historical purposes.

[RCDB](http://www.rcdb.justinjaffray.com/)<br>
[SpeedSolving Thread](http://www.speedsolving.com/forum/showthread.php?43580-Reconstruction-Database-RCDB)

Contributing to RCDB
====================

RCDB uses Ruby 2.0.0, so make sure you have that installed.

You can clone the repo and verify that everything works by running the following commands in your shell:

```shell
$  git clone git@github.com:justinj/reconstruction-database.git
$  cd reconstruction-database
$  bundle install
$  rake test
```

You'll want to set up some sample data, so run the following command to set up a testing database:

```shell
$ rake seed
```

This will add some solves,
and set up an admin account whose username is "admin" and whose password is "password"

Once you've done that, and if all the tests pass,
you should be good to run the server:

```shell
$  bundle exec ruby app.rb
```

Then point your browser to `localhost:4567` and you should be good!

To login to the new admin account go to `localhost:4567/login`.

Thanks
======

Favicon and logo were made by Kristopher De Asis
