from celery.utils.log import get_task_logger
from celery import task

from dashboard.utils import api_key_change_mail

logger = get_task_logger(__name__)


@task(name="send_api_key_change")
def send_api_key_change(reciver):
    """Send mail when api key has changed"""

    logger.info("Email sending...")

    return api_key_change_mail(reciver)
