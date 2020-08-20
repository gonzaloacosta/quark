FROM python:3-onbuild
ENV APP_SCRIPT app.py
EXPOSE 5000
CMD [ "python", "./app.py" ]
