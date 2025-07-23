from flask import Flask, request
import os

app = Flask(__name__)

@app.route("/")
def index():
    return "Vulnerable App Running"

@app.route("/rce")
def rce():
    cmd = request.args.get("cmd")
    return os.popen(cmd).read()

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
