Sanimap
=======

Sanitary Risk Map for the Sanitation Hackathon in Latin America.

-----------

# Installation


0. Dependencies:
- python 2.7
- git
- postgresql 8.4+
- postgis 1.5+ (see the Aditional Notes at the end)


1. Clone project from github
git clone git clone git@github.com:manubellido/sanimap.git

2. Install a VirtualEnv environment
   cd sanimap
   virtualenv env
   source env/bin/activate

3. Install Python dependencies using pip
   env/bin/pip install django
   env/bin/pip install psycopg2

4. Set up the database

   createuser name_of_user (accept superuser permission if desired)
   createdb name_of_database
   createlang plpgsql name_of_database

5. Apply postgis to the database

   psql -U name_of_user -d name_of_database -f /usr/share/postgresql/9.1/contrib/postgis-1.5/postgis.sql
   psql -U name_of_user -d name_of_database -f /usr/share/postgresql/9.1/contrib/postgis-1.5/spatial_ref_sys.sql

6. Create database tables for Django, deps and apps:

    create tables on database
    env/bin/python manage.py syncdb
    Apply any South migration
    env/bin/python manage.py migrate


7. Run the test web server:

   env/bin/python manage.py runserver 0.0.0.0:8000 --settings=settings

