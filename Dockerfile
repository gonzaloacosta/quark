FROM python:3-onbuild
ENV APP_SCRIPT app.py
EXPOSE 8080
CMD [ "python", "./app.py" ]
