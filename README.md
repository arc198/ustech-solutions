# ustech-solutions
created rest APIfor interview task


clone code from the repository.

   source venv/bin/activate.   # only if you are creating your new environment

install mysql workbench in your system

install requirements.txt

pip install -r requirements.txt


create database names in mysql workbench 

mysqlworkbench >>>>>> new  >>>databasename   >>>>>>create


here we have to create two database names one is 'game' and another one is 'matches'


then makemigrations and migrate as below steps

  1)python manage.py makemigrations
  2)python manage.py migrate
  3)./manage.py migrate matches --database=matches
  
  
Finally run server with below command

python manage.py runserver


For testing rest APIs please read and folow urls from interview task api details.pdf which uploaded above

