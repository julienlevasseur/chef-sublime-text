# sublime_text

![Build Status](https://travis-ci.org/julienlevasseur/chef-sublime-text.svg?branch=master)

Manage installation & configuration of Sublime-Text.

# State

The `node['sublime_text']['state']` attribute allow to manage weither sublime-text must be installed or removed.

By default, sublime-text is installed:

```
default['sublime_text']['state'] = :present
```

To uninstall it and keeping it removed :

```
default['sublime_text']['state'] = :absent
```

