# VERY basic tests just to see if nothing breaks easily.

echo "[Without command]"
ruby vcsmap.rb

echo "[With list command]"
ruby vcsmap.rb list

echo "[With invalid command]"
ruby vcsmap.rb invalid

echo "[With run command, no plugin]"
ruby vcsmap.rb run

echo "[With run command, invalid plugin]"
ruby vcsmap.rb run invalid

echo "[With run command, valid plugin, invalid pages]"
ruby vcsmap.rb run filezilla_xml invalid

echo "[With run command, valid plugin, invalid pages, no ascii]"
ruby vcsmap.rb run filezilla_xml invalid --no-ascii

echo "[With run command, valid plugins, 1 page]"
ruby vcsmap.rb run filezilla_xml 1
ruby vcsmap.rb run google_oauth 1
ruby vcsmap.rb run solr_dataconfig 1
ruby vcsmap.rb run sublime_github 1
ruby vcsmap.rb run wordpress_config 1

echo "[With run command, valid plugin, 2 pages]"
ruby vcsmap.rb run filezilla_xml 2

echo "[With run command, valid plugin, 1 page, no ascii]"
ruby vcsmap.rb run filezilla_xml 1 --no-ascii
