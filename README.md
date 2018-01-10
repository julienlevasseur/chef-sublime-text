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

# Attributes

| Attribute                                  | Type   | Default value                                                                                          | Description |
| ------------------------------------------ | ------ | ------------------------------------------------------------------------------------------------------ | ----------- |
| `['sublime_text']['state']`                | Symbol | `:present`                                                                                             | Sublime Text installation state |
| `['sublime_text']['users']`                | List   | []                                                                                                     | Usersfor who Sublime have to be configured |
| `['sublime_text']['repo']['uri']`          | String | https://download.sublimetext.com/                                                                      | Download URL |
| `['sublime_text']['repo']['key']['url']`   | String | https://download.sublimetext.com/sublimehq-pub.gpg                                                     | Repo key URL |
| `['sublime_text']['repo']['distribution']` | String | apt/stable/                                                                                            | Repository's distribution |
| `['sublime_text']['packages']`             | List   | [{name: 'Neon Color Scheme', url: 'https://github.com/MattDMo/Neon-color-scheme/archive/master.zip',}] | Packages to isntall |
| `['sublime_text']['syntax_specific']`      | Hash   | {JSON: {color_scheme: '"Packages/Neon Color Scheme/Neon.tmTheme"',},}                                  | Syntax specific configurations |

# How to add a package to the intalled packages list

1. Go to https://packagecontrol.io

2. Search for the package name you want to install

![](https://raw.githubusercontent.com/julienlevasseur/chef-sublime-text/master/screenshot_01.png)

3. Click on the link to access the package details page

![](https://raw.githubusercontent.com/julienlevasseur/chef-sublime-text/master/screenshot_02.png)

4. Click on the homepage link

![](https://raw.githubusercontent.com/julienlevasseur/chef-sublime-text/master/screenshot_03.png)

5. Click on "Clone or download" green button

![](https://raw.githubusercontent.com/julienlevasseur/chef-sublime-text/master/screenshot_04.png)

6. Right-click on Download ZIP button, then select "copy link location"

![](https://raw.githubusercontent.com/julienlevasseur/chef-sublime-text/master/screenshot_05.png)

7. Add the `name` and the `url` to `['sublime_text']['packages']` attribute:

```json
{
    "name": "Terraform",
    "url": "https://github.com/alexlouden/Terraform.tmLanguage/archive/master.zip"
}
```
