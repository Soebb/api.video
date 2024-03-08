FROM python:3.10-slim-bullseye

WORKDIR /app

COPY . ./
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir gunicorn

EXPOSE 5000
CMD gunicorn -b :5000 --reload --access-logfile - --error-logfile - app:app
