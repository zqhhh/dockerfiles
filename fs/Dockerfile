FROM python:alpine

COPY fs.py /usr/bin/fs.py
RUN chmod +x /usr/bin/fs.py
ENV PYTHONUNBUFFERED 1
WORKDIR /fs

CMD ["fs.py", "80"]