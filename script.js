// API Configuration
const API_BASE_URL = 'http://localhost:5000';

// DOM Elements
const mainMenu = document.getElementById('main-menu');
const quizInterface = document.getElementById('quiz-interface');
const resultsInterface = document.getElementById('results-interface');
const categoryCards = document.querySelectorAll('.category-card');
const questionText = document.getElementById('question-text');
const optionsContainer = document.getElementById('options-container');
const timerElement = document.getElementById('timer');
const scorePercentage = document.getElementById('score-percentage');
const correctAnswers = document.getElementById('correct-answers');
const totalQuestionsResults = document.getElementById('total-questions-results');
const categoryTitle = document.getElementById('category-title');
const currentScore = document.getElementById('current-score');

// Quiz State
let currentCategory = '';
let questions = [];
let currentQuestionIndex = 0;
let score = 0;
let timer;
let timeLeft = 30;
let userAnswers = [];
let isAnswerSelected = false;

// Event Listeners
document.addEventListener('DOMContentLoaded', () => {
    // Add click event to all category cards
    categoryCards.forEach(card => {
        card.addEventListener('click', async () => {
            currentCategory = card.dataset.category;
            await startQuiz();
        });
    });

    // Navigation buttons
    document.getElementById('prev-btn').addEventListener('click', showPreviousQuestion);
    document.getElementById('next-btn').addEventListener('click', showNextQuestion);
    document.getElementById('submit-btn').addEventListener('click', submitQuiz);

    // Results interface buttons
    const closeResultsBtn = document.getElementById('close-results');
    const homeBtn = document.getElementById('home-btn');

    closeResultsBtn.addEventListener('click', () => {
        resultsInterface.classList.remove('active');
        mainMenu.classList.add('active');
    });

    homeBtn.addEventListener('click', returnToHome);
});

// Quiz Functions
async function startQuiz() {
    try {
        // Show loading state
        quizInterface.classList.add('loading');
        
        // Fetch questions from API
        const response = await fetch(`${API_BASE_URL}/questions/random/${currentCategory}/10`);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        questions = await response.json();
        
        if (questions.length === 0) {
            throw new Error('No questions available for this category');
        }

        // Reset quiz state
        currentQuestionIndex = 0;
        score = 0;
        userAnswers = [];
        isAnswerSelected = false;
        
        // Update UI
        mainMenu.classList.remove('active');
        quizInterface.classList.remove('loading');
        quizInterface.classList.add('active');
        categoryTitle.textContent = currentCategory;
        
        // Start timer and display first question
        startTimer();
        displayQuestion();
    } catch (error) {
        console.error('Error starting quiz:', error);
        // Show error message to user
        const errorMessage = error.message || 'Failed to start quiz. Please try again.';
        showError(errorMessage);
        quizInterface.classList.remove('loading');
    }
}

function displayQuestion() {
    const question = questions[currentQuestionIndex];
    
    // Check if we have a previous answer for this question
    const previousAnswer = userAnswers[currentQuestionIndex];
    isAnswerSelected = !!previousAnswer;
    
    // Update question text and number
    questionText.textContent = question.question_text;
    document.getElementById('current-question').textContent = currentQuestionIndex + 1;
    document.getElementById('total-questions').textContent = questions.length;
    
    // Clear previous options
    optionsContainer.innerHTML = '';
    
    // Create options
    const options = [
        question.option1,
        question.option2,
        question.option3,
        question.option4
    ];
    
    options.forEach((option, index) => {
        const optionElement = document.createElement('div');
        optionElement.className = 'option';
        optionElement.textContent = option;
        
        // If reviewing a previously answered question
        if (previousAnswer) {
            optionElement.classList.add('disabled');
            if (option === previousAnswer.selectedAnswer) {
                optionElement.classList.add(previousAnswer.isCorrect ? 'correct' : 'incorrect');
            }
            if (!previousAnswer.isCorrect && option === question.correct_answer) {
                optionElement.classList.add('correct');
            }
        } else {
            optionElement.addEventListener('click', () => selectAnswer(index));
        }
        
        optionsContainer.appendChild(optionElement);
    });
    
    // Update navigation buttons and score
    updateNavigationButtons();
    updateCurrentScore();
}

function selectAnswer(selectedIndex) {
    if (isAnswerSelected) return;
    
    isAnswerSelected = true;
    const question = questions[currentQuestionIndex];
    const selectedAnswer = question[`option${selectedIndex + 1}`];
    const isCorrect = selectedAnswer === question.correct_answer;
    
    // Store user's answer
    userAnswers[currentQuestionIndex] = {
        questionIndex: currentQuestionIndex,
        selectedAnswer: selectedAnswer,
        isCorrect: isCorrect
    };
    
    // Update score if correct
    if (isCorrect) {
        score++;
        updateCurrentScore();
    }
    
    // Update option styles
    const options = document.querySelectorAll('.option');
    options.forEach((option, index) => {
        option.classList.add('disabled');
        if (index === selectedIndex) {
            option.classList.add(isCorrect ? 'correct' : 'incorrect');
        }
        if (!isCorrect && question[`option${index + 1}`] === question.correct_answer) {
            option.classList.add('correct');
        }
    });
    
    // Show feedback
    showFeedback(isCorrect, question.correct_answer);
    
    // Move to next question after delay
    setTimeout(() => {
        if (currentQuestionIndex < questions.length - 1) {
            currentQuestionIndex++;
            isAnswerSelected = false;
            displayQuestion();
            startTimer(); // Restart timer for next question
        } else {
            submitQuiz();
        }
    }, 2000);
}

function showFeedback(isCorrect, correctAnswer) {
    const feedbackContainer = document.getElementById('feedback-container');
    const feedbackTitle = document.getElementById('feedback-title');
    const feedbackMessage = document.getElementById('feedback-message');
    
    feedbackTitle.textContent = isCorrect ? 'Correct! 🎉' : 'Incorrect ❌';
    feedbackMessage.textContent = isCorrect ? 
        'Great job! Keep going!' : 
        `The correct answer was: ${correctAnswer}`;
    
    feedbackContainer.style.display = 'block';
    feedbackContainer.style.opacity = '1';
    
    // Animate feedback
    feedbackContainer.classList.add('active');
    
    // Hide feedback after delay
    setTimeout(() => {
        feedbackContainer.classList.remove('active');
        feedbackContainer.style.opacity = '0';
        setTimeout(() => {
            feedbackContainer.style.display = 'none';
        }, 300);
    }, 1700);
}

function updateCurrentScore() {
    currentScore.textContent = `Score: ${score}/${questions.length}`;
}

function updateNavigationButtons() {
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');
    const submitBtn = document.getElementById('submit-btn');
    
    prevBtn.disabled = currentQuestionIndex === 0;
    nextBtn.style.display = currentQuestionIndex === questions.length - 1 ? 'none' : 'block';
    submitBtn.style.display = currentQuestionIndex === questions.length - 1 ? 'block' : 'none';
}

function showPreviousQuestion() {
    if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
        isAnswerSelected = false;
        displayQuestion();
    }
}

function showNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        isAnswerSelected = false;
        displayQuestion();
    }
}

async function submitQuiz() {
    clearInterval(timer);
    
    // Calculate final score
    const finalScore = (score / questions.length) * 100;
    
    try {
        // Submit score to API
        const response = await fetch(`${API_BASE_URL}/scores`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                category: currentCategory,
                score: finalScore,
                time_taken: 30 - timeLeft
            })
        });

        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        // Show results
        showResults(finalScore);
    } catch (error) {
        console.error('Error submitting quiz:', error);
        alert('Failed to submit quiz results. Please try again.');
    }
}

function showResults(finalScore) {
    // Calculate final score percentage
    const scorePercentage = (score / questions.length) * 100;
    
    // Redirect to scorecard.html with parameters
    window.location.href = `scorecard.html?score=${scorePercentage}&correct=${score}&total=${questions.length}`;
}

function createConfetti() {
    const confettiContainer = document.getElementById('confetti-container');
    confettiContainer.innerHTML = '';
    
    for (let i = 0; i < 100; i++) {
        const confetti = document.createElement('div');
        confetti.className = 'confetti';
        confetti.style.left = Math.random() * 100 + '%';
        confetti.style.animationDelay = Math.random() * 2 + 's';
        confetti.style.backgroundColor = getRandomColor();
        confettiContainer.appendChild(confetti);
    }
}

function getRandomColor() {
    const colors = ['#FF6B6B', '#4ECDC4', '#45B7D1', '#96CEB4', '#FFEEAD', '#D4A5A5'];
    return colors[Math.floor(Math.random() * colors.length)];
}

function returnToHome() {
    // Add fade out animation
    resultsInterface.style.opacity = '0';
    resultsInterface.style.transition = 'opacity 0.5s ease';
    
    // Wait for fade out animation to complete before hiding
    setTimeout(() => {
        resultsInterface.classList.remove('active');
        resultsInterface.style.opacity = '1';
        mainMenu.classList.add('active');
        
        // Reset quiz state
        currentQuestionIndex = 0;
        score = 0;
        userAnswers = [];
        isAnswerSelected = false;
    }, 500);
}

// Timer Functions
function startTimer() {
    timeLeft = 30;
    updateTimerDisplay();
    
    if (timer) {
        clearInterval(timer);
    }
    
    timer = setInterval(() => {
        timeLeft--;
        updateTimerDisplay();
        
        if (timeLeft <= 0) {
            clearInterval(timer);
            submitQuiz();
        }
    }, 1000);
}

function updateTimerDisplay() {
    if (timerElement) {
        const minutes = Math.floor(timeLeft / 60);
        const seconds = timeLeft % 60;
        timerElement.textContent = `${minutes}:${seconds.toString().padStart(2, '0')}`;
        
        // Add visual warning when time is running low
        if (timeLeft <= 10) {
            timerElement.classList.add('warning');
        } else {
            timerElement.classList.remove('warning');
        }
    }
}

function showError(message) {
    const errorContainer = document.createElement('div');
    errorContainer.className = 'error-message';
    errorContainer.textContent = message;
    
    // Remove any existing error messages
    const existingError = document.querySelector('.error-message');
    if (existingError) {
        existingError.remove();
    }
    
    // Add new error message
    document.body.appendChild(errorContainer);
    
    // Remove error message after 5 seconds
    setTimeout(() => {
        errorContainer.remove();
    }, 5000);
}