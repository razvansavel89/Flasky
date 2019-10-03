
BASE_HOST = "http://0.0.0.0"
PORT = 5000
BASE_PATH = "/api/"


def get_formatted_URL():
    return "{}:{}{}".format(BASE_HOST, PORT, BASE_PATH)
