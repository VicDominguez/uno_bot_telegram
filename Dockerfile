FROM python:3.8-slim-buster

ARG api_token

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies:
COPY requirements.txt .
RUN pip install -r requirements.txt

# Run the application:
RUN /locales/compile.sh
COPY set_token.py .
CMD ["python3", "set_token.py", api_token]
COPY bot.py .
CMD ["python3", "bot.py"]