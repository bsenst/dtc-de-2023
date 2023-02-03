# https://api.slack.com/messaging/webhooks

from prefect.blocks.notifications import SlackWebhook

slack_webhook_block = SlackWebhook.load("this-is-the-block-name")
slack_webhook_block.notify("Hello from Prefect!")