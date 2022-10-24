# from pynput import *
# def get_coords(x, y):
#   print("Current Position: ()".format((x, y)))
# with mouse.Listener(on_move = get_coords) as listen:
#   listen.join()

from fastapi import FastAPI, Request
from fastapi_utils.tasks import repeat_every
from fastapi.middleware.cors import CORSMiddleware
import uvicorn
import json 
from datetime import datetime
from constants import CORS_URLS
import itertools
import pyautogui
import time

# TODO (3.1): define FastAPI app
app = FastAPI()

# TODO (3.2): add CORS middleware
app.add_middleware(
        CORSMiddleware,
        allow_origins=CORS_URLS,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
)

@app.get("/")
async def root():
    content = {"message": "Hello World! This is a testing api!"}
    # try:
    #     lastX, lastY = pyautogui.position()
    #     while True:
    #         x, y = pyautogui.position()
    #         if x != lastX and y != lastY:
    #             print(str(x) + " " + str(y))
    #             lastX = x
    #             lastY = y

    # except KeyboardInterrupt:
    #     print("\nDone")
    return json.dumps(content)

# try:
#     lastX, lastY = pyautogui.position()
#     while True:
#         x, y = pyautogui.position()
#         if x != lastX and y != lastY:
#             print(str(x) + " " + str(y))
#             lastX = x
#             lastY = y

# except KeyboardInterrupt:
#     print("\nDone")

# main function to run the server
if __name__ == '__main__':
    uvicorn.run(app, host="127.0.0.1", port=8000)