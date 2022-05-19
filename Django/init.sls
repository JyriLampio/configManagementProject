Install apache2:
  pkg.installed:
    - name: Apache2
#    - name: virtualenv
#    - name: libapache2-mod-wsgi-py3

install virtualenv:
  pkg.installed:
    - name virtualenv

install libapache:
  pkg.installed:
    - name: libapache2-mod-wsgi-py3

apache enable wsgi:
  apache_module.enabled:
    - name: wsgi
    
create_directory:
  file.directory:
  - name: ~jyri/publicwsgi


/home/jyri/publicwsgi/env:
  virtualenv.managed:
    - system_site_packages: true
    - -p: python3
    - requirements: salt://django/requirements.txt

source /home/jyri/publicwsgi/env/bin/activate && django-admin startproject testi:
  cmd.run:
    - cwd: /home/jyri/publicwsgi/
    - unless: test -d /home/jyri/publicwsgi/testi

/home/jyri/publicwsgi/testi/db.sqlite3:
  file.managed:
    - source: salt://django/db.sqlite3

#/home/jyri/publicwsgi/testi/testi/settings.py:
#  file.managed:
#    - source: salt://django/settings.py

/etc/apache2/sites-available/testi.conf:
  file.managed:
    - source: salt://django/testi.conf

disable default site:
  apache_site.disabled:
    - name: 000-default

enable_default_site:
  apache_site.enabled:
    - name: testi.conf

