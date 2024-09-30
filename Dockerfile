FROM python:3

WORKDIR /app
RUN apt-get update && apt-get install -y dnsutils

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

ENV PROFILE=${PROFILE}
ENV BASE_URL_API_BITRIX=${BASE_URL_API_BITRIX}
ENV CODIGO_BITRIX=${CODIGO_BITRIX}
ENV PORT=${PORT}

COPY . /app

EXPOSE 7898

CMD ["python", "comapifeita.py"]
