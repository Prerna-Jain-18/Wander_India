from flask import Flask
from .config import Config  # Use a relative import instead of absolute

app = Flask(__name__)
app.config.from_object(Config)
app.secret_key = '96541'


from app import routes
