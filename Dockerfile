FROM python:3.8-slim-buster

ARG api_token

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies:
RUN apt-get update && apt-get install -y gettext
COPY requirements.txt .
RUN pip install -r requirements.txt

# Compile the application:
COPY /locales/compile.sh .
RUN bash compile.sh

#Set telegram token
COPY set_token.py .
RUN python3 set_token.py $api_token

#Run
COPY bot.py .
CMD ["python3", "bot.py"]
