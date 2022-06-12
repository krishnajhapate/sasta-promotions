from celery import task

from authapp.utils import *


@task(name="send_welcome_mail")
def send_welcome_mail(email, firstname):

    return welcome_mail_send(email, firstname)


@task(name="reset_password_mail")
def reset_password_mail(email, firstname, otp):

    return send_reset_password_mail(email, firstname, otp)


@task(name="reset_password_mail")
def reset_password_success_mail(email, firstname):

    return send_reset_password_success_mail(email, firstname)
