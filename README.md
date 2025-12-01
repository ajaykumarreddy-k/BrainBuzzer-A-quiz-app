 # 🧠 BrainBuzzer - A Quiz App

![Project Status](https://img.shields.io/badge/status-ready-success.svg)
![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)
![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=flat&logo=python&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-ES6-F7DF1E?style=flat&logo=javascript&logoColor=black)
![SQL](https://img.shields.io/badge/Database-SQL-4479A1?style=flat&logo=mysql&logoColor=white)

## 📖 About

**BrainBuzzer** is a full-stack interactive quiz application designed to challenge your knowledge across various interesting genres. Built with a **Python** backend and a responsive **HTML/JS** frontend, it offers a seamless trivia experience with real-time scoring and category selection.

### ✨ Key Features

-   **🎯 Multi-Genre Quizzes:** Choose from diverse categories including:
    -   🍔 Food
    -   🧮 Math
    -   🎬 Movies
    -   🌍 Geography (Globe)
    -   🎮 Games
-   **📊 Live Score Tracking:** Instant feedback on your answers and a dedicated scorecard view.
-   **💾 Robust Data Management:** Powered by an SQL database to manage a vast bank of questions.
-   **⚡ Fast & Lightweight:** Minimalist frontend ensures quick load times and smooth transitions.

## 🛠️ Tech Stack

-   **Frontend:** HTML5, CSS3, JavaScript (Vanilla)
-   **Backend:** Python (`app.py`)
-   **Database:** SQL (`brainbuzzerfresh.sql`), CSV Support (`questions.csv`)
-   **Assets:** Custom category icons

## 🚀 Getting Started

Follow these instructions to set up the project locally.

### Prerequisites

-   **Python 3.x** installed.
-   **MySQL** (or a compatible SQL database server) if utilizing the `.sql` file directly.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/ajaykumarreddy-k/BrainBuzzer-A-quiz-app.git](https://github.com/ajaykumarreddy-k/BrainBuzzer-A-quiz-app.git)
    cd BrainBuzzer-A-quiz-app
    ```

2.  **Install Python dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

3.  **Database Setup:**
    -   Import the `brainbuzzerfresh.sql` file into your SQL database tool (like MySQL Workbench or phpMyAdmin) to initialize the tables.
    -   *Alternatively, ensure `questions.csv` is in the root directory if the app supports CSV fallback.*

4.  **Run the Application:**
    ```bash
    python app.py
    ```

5.  **Play the Quiz:**
    Open your browser and navigate to the local address shown in your terminal (usually `http://127.0.0.1:5000` or similar).

## 📂 Project Structure

```text
BrainBuzzer-A-quiz-app/
├── app.py                  # Main Python application (Backend logic)
├── script.js               # Frontend game logic and event handling
├── styles.css              # Application styling
├── index.html              # Main entry point (Category selection)
├── scorecard.html          # Result display page
├── questions.csv           # Question bank dataset
├── brainbuzzerfresh.sql    # Database schema and initial data
├── requirements.txt        # Python dependency list
├── *.jpg                   # Category icons (math, movie, food, etc.)
└── app.log                 # Application log file
