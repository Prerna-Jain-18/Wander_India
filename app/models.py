from app import db

class TouristPlaces(db.Model):
    __tablename__ = 'TouristPlaces'

    id = db.Column(db.Integer, primary_key=True)
    state_id = db.Column(db.Integer, db.ForeignKey('States.id'), nullable=False)
    name = db.Column(db.String(100), nullable=False, unique=True)
    description = db.Column(db.Text, nullable=True)
    category = db.Column(db.String(50), nullable=True)
    latitude = db.Column(db.Numeric(9, 6), nullable=True)
    longitude = db.Column(db.Numeric(9, 6), nullable=True)
    image_url = db.Column(db.String(255), nullable=True)

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'description': self.description,
            'category': self.category,
            'latitude': self.latitude,
            'longitude': self.longitude,
            'image_url': self.image_url
        }

class FoodRecommendations(db.Model):
    __tablename__ = 'FoodRecommendations'

    id = db.Column(db.Integer, primary_key=True)
    state_id = db.Column(db.Integer, db.ForeignKey('States.id'), nullable=False)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text, nullable=True)
    image_url = db.Column(db.String(255), nullable=True)

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'description': self.description,
            'image_url': self.image_url
        }

class Festivals(db.Model):
    __tablename__ = 'Festivals'

    id = db.Column(db.Integer, primary_key=True)
    state_id = db.Column(db.Integer, db.ForeignKey('States.id'), nullable=False)
    name = db.Column(db.String(100), nullable=False, unique=True)
    description = db.Column(db.Text, nullable=True)
    date = db.Column(db.Date, nullable=True)

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'description': self.description,
            'date': str(self.date)
        }
