import asyncio
import os
import sys
import requests
from telegram import Bot
from Setting import bot_token, chat_id


async def send_file_to_telegram_bot(bot_token, chat_id, file_path):
    """
    Sends a file to a user in Telegram using a Telegram bot.
    """
    bot = Bot(token=bot_token)
    with open(file_path, 'rb') as file:
        await bot.send_document(chat_id=chat_id, document=file)  # Await the send_document coroutine

async def main():
    """
    Main function to send latest backup to a user in Telegram .
    """
    latest_backup_path = sys.argv[1] 
    
    await send_file_to_telegram_bot(bot_token, chat_id, latest_backup_path)


if __name__ == "__main__":
    asyncio.run(main())


