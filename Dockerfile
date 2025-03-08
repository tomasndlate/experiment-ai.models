FROM public.ecr.aws/lambda/python:3.11

WORKDIR /var/task

COPY src/ .

RUN pip install -r requirements.txt

CMD ["main.handler"]