# VERY basic tests just to see if nothing breaks easily.

echo "[Without command]"
bin/vcsmap

echo "[With list command]"
bin/vcsmap list

echo "[With invalid command]"
bin/vcsmap invalid

echo "[With run command, no plugin]"
bin/vcsmap run

echo "[With run command, invalid plugin]"
bin/vcsmap run invalid

echo "[With run command, valid plugin, invalid pages]"
bin/vcsmap run filezilla_xml invalid

echo "[With run command, valid plugin, invalid pages, no ascii]"
bin/vcsmap run filezilla_xml invalid --no-ascii

echo "[With run command, valid plugins, 1 page]"
bin/vcsmap run filezilla_xml 1
bin/vcsmap run google_oauth 1
bin/vcsmap run solr_dataconfig 1
bin/vcsmap run sublime_github 1
bin/vcsmap run wordpress_config 1

echo "[With run command, valid plugin, 2 pages]"
bin/vcsmap run filezilla_xml 2

echo "[With run command, valid plugin, 1 page, no ascii]"
bin/vcsmap run filezilla_xml 1 --no-ascii
