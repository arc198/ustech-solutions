# ustech-solutions
created rest APIfor interview task


clone code from the repository.

   source venv/bin/activate.   # only if you are creating your new environment

install mysql workbench in your system

install requirements.txt

pip install -r requirements.txt


create database names in mysql workbench 

   for new create:-mysqlworkbench >>>>>> new  >>>databasename   >>>>>>create
   
   for testing with existing databse please import game.sql and matches.sql to your work bench from  thei repository.


here we have to create two database names one is 'game' and another one is 'matches'


then makemigrations and migrate as below steps

  1)python manage.py makemigrations
  2)python manage.py migrate
  3)./manage.py migrate matches --database=matches
  
  
Finally run server with below command

python manage.py runserver


For testing rest APIs please read and folow urls from interview task api details.pdf which uploaded above


# Urls for CRUD opeartions of team:-

127.0.0.1:8000/game/create_team/                (for creating POST and for listing GET)

127.0.0.1:8000/game/update_team/3/              (for updating PUT and for deleting DELETE)


# Urls for CRUD opeartions of playears:-

127.0.0.1:8000/game/TGHlHF/playear_details/     (for creating POST and for listing GET)

127.0.0.1:8000/game/TGHlHF/playear_details/3/   (for updating PUT and for deleting DELETE)

# 127.0.0.1:8000/game/<team_slug>/playear_details/<pk>/



# Urls for CRUD opeartions of matches:-

127.0.0.1:8000/match/create_match/              (for creating POST and for listing GET)

127.0.0.1:8000/match/update_match/2/            (for updating PUT and for deleting DELETE)


# Note:- for all CRUD operations we can use browser with abocve urls

# Note:- for updating points we have to test using postman broweser will not support.

# Urls for CRUD opeartions of points:-

127.0.0.1:8000/match/CHiyFu/create_points/      (for creating POST)

# 127.0.0.1:8000/match/<match_slug>/create_points/      (for creating POST)

127.0.0.1:8000/match/list_points/               (for listing GET)

127.0.0.1:8000/match/update_points/2/        (for updating PUT and for deleting DELETE)

127.0.0.1:8000/match/update_points/<pk>/        (for updating PUT and for deleting DELETE). pk is id




