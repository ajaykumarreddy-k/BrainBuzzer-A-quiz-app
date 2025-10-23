from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
import pandas as pd
import os
import random

app = Flask(__name__)
CORS(app)

# SQLite database configuration
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///quiz.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# Models
class Question(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    category = db.Column(db.String(50), nullable=False)
    difficulty = db.Column(db.String(20), nullable=False)
    question_text = db.Column(db.String(500), nullable=False)
    option1 = db.Column(db.String(200), nullable=False)
    option2 = db.Column(db.String(200), nullable=False)
    option3 = db.Column(db.String(200), nullable=False)
    option4 = db.Column(db.String(200), nullable=False)
    correct_answer = db.Column(db.String(200), nullable=False)

class Score(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    category = db.Column(db.String(50), nullable=False)
    score = db.Column(db.Float, nullable=False)
    time_taken = db.Column(db.Integer, nullable=False)

def init_db():
    with app.app_context():
        # Create tables
        db.create_all()
        
        # Check if questions table is empty
        if Question.query.count() == 0:
            try:
                # Read questions from CSV
                df = pd.read_csv('questions.csv')
                
                # Map CSV columns to database columns
                for _, row in df.iterrows():
                    # Convert correct option letter to actual answer
                    correct_option = row['correct_option']
                    correct_answer = row[f'option_{correct_option.lower()}']
                    
                    question = Question(
                        category=row['genre'],
                        difficulty=row['level'],
                        question_text=row['question_text'],
                        option1=row['option_a'],
                        option2=row['option_b'],
                        option3=row['option_c'],
                        option4=row['option_d'],
                        correct_answer=correct_answer
                    )
                    db.session.add(question)
                
                db.session.commit()
                print("Database initialized with questions from CSV")
            except Exception as e:
                print(f"Error initializing database: {e}")
                db.session.rollback()

# Routes
@app.route('/')
def home():
    return jsonify({"message": "Welcome to Brain Buzzer API"})

@app.route('/questions/<category>', methods=['GET'])
def get_questions(category):
    questions = Question.query.filter_by(category=category).all()
    if not questions:
        return jsonify({"error": "No questions found for this category"}), 404
    return jsonify([{
        'id': q.id,
        'category': q.category,
        'question_text': q.question_text,
        'correct_answer': q.correct_answer,
        'option1': q.option1,
        'option2': q.option2,
        'option3': q.option3,
        'option4': q.option4,
        'difficulty': q.difficulty
    } for q in questions])

@app.route('/questions/random/<category>/<int:count>', methods=['GET'])
def get_random_questions(category, count):
    questions = Question.query.filter_by(category=category).all()
    if not questions:
        return jsonify({"error": "No questions found for this category"}), 404
    if count > len(questions):
        count = len(questions)
    random_questions = random.sample(questions, count)
    return jsonify([{
        'id': q.id,
        'category': q.category,
        'question_text': q.question_text,
        'correct_answer': q.correct_answer,
        'option1': q.option1,
        'option2': q.option2,
        'option3': q.option3,
        'option4': q.option4,
        'difficulty': q.difficulty
    } for q in random_questions])

@app.route('/scores', methods=['POST'])
def create_score():
    data = request.get_json()
    if not data or not all(k in data for k in ('category', 'score', 'time_taken')):
        return jsonify({"error": "Missing required fields"}), 400
    
    try:
        score = Score(
            category=data['category'],
            score=data['score'],
            time_taken=data['time_taken']
        )
        
        db.session.add(score)
        db.session.commit()
        
        return jsonify({
            'id': score.id,
            'category': score.category,
            'score': score.score,
            'time_taken': score.time_taken
        }), 201
    except Exception as e:
        db.session.rollback()
        return jsonify({"error": str(e)}), 500

@app.route('/leaderboard/<category>', methods=['GET'])
def get_leaderboard(category):
    scores = Score.query.filter_by(category=category)\
        .order_by(Score.score.desc())\
        .limit(10)\
        .all()
    return jsonify([{
        'id': s.id,
        'category': s.category,
        'score': s.score,
        'time_taken': s.time_taken
    } for s in scores])

if __name__ == '__main__':
    init_db()
    app.run(debug=True) 