from celery import task

from authapp.utils import welcome_mail_send


@task(name="send_welcome_mail")
def send_welcome_mail(email, firstname):

    return welcome_mail_send(email, firstname)
