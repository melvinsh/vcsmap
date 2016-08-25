vcsmap
========

![vcsmap screenshot](https://cloud.githubusercontent.com/assets/1312973/17897353/2ec8c11a-6954-11e6-9906-4f4f0926f58d.png)

vcsmap is a plugin-based tool to scan public version control systems (GitHub and [possibly Gitlab soon](https://gitlab.com/gitlab-org/gitlab-ee/issues/556)) for sensitive information like access tokens and credentials. 

## Installation
Download the source code and run the following command. You need a recent version of Ruby with [bundler](http://bundler.io) and you might need build tools like `gcc` to build the dependencies.
``` ruby
$ bundle
```

## Usage
vcsmap already includes a couple of plugins. Each plugin looks for files that match a certain search query, and extracts the right data from those files. To view all plugins run:
```
$ ruby vcsmap.rb list
```

To use a plugin, look up the name of the plugin (`[plugin_name]`) and run the following command:
```
$ ruby vcsmap.rb run {plugin_name} {pages} {--no-ascii}
```
- You need to specify the amount of pages you want to search. Each (GitHub) page has 10 possible results.
- Use the `--no-ascii` flag (last) to disable rendering the results as an ASCII table in the command line.

## Plugin development
To add a new plugin, create an entry for it in `lib/plugin_list.rb` and create a new plugin class that extends `Vcsmap::Plugin::BasePlugin` in `lib/plugins`. 

Each plugin has a `@search_string` that is used to search for matching files, and a couple of regex matchers to extract the needed data. Of course you don't need to use regex, it's also possible to parse the file (e.g. with `JSON`), as long as your plugin returns a valid `table_header` and matching `credentials`.

**The easiest way** to develop a new plugin is to copy an simple existing one (like `lib/plugins/solr_dataconfig.rb`) and modify it until it fits your requirements. Need inspiration? Check out [techgaun/github-dorks](https://github.com/techgaun/github-dorks)!.

## DISCLAIMER
Using the data obtained by this tool to gain unauthorized to access computer systems or services is **ILLEGAL** and therefore punishable by law. The author of this tool is **not** responsible for any damage caused by use/abuse of this tool.
