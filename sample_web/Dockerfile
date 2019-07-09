FROM python:3.7
RUN apt-get update 
RUN mkdir app
COPY . /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt
ENV FLASK_APP=app.py
EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
