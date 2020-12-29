if [ ! -d "site-packages" ]; then
  docker run -d --name=mypyapp otrodeteruel/mypyal3.7 /bin/ash
  sleep 2
  docker cp mypyapp:/usr/local/lib/python3.7/site-packages ./site-packages
  docker rm -f mypyapp
fi


docker run -it --rm \
--name=mypyapp \
-e FLASK_APP=app.py \
-e FLASK_ENV=development \
-p 5000:5000 \
-v $PWD/site-packages:/usr/local/lib/python3.7/site-packages \
-v $PWD/app:/app \
otrodeteruel/mypyal3.7 \
/bin/ash
