# अपनी भाषा अपनी संस्कृति


**अपनी भाषा अपनी संस्कृति** is a cross-platform Flutter application that translates English sentences and terms into Braj, a local Hindi dialect. The application is designed to be highly responsive, ensuring a seamless user experience across both web and mobile platforms. In addition to its core translation functionality, the app also includes a dictionary feature for learning Braj and a page dedicated to showcasing visualizations of the underlying machine learning model.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Tools and Libraries Used](#tools-and-libraries-used)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Model Details](#model-details)
- [API Documentation](#api-documentation)
- [Dockerization](#dockerization)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Introduction

Language is a powerful tool, and the ability to bridge linguistic gaps opens up new avenues for communication and learning. **अपनी भाषा अपनी संस्कृति** is an initiative to preserve and promote the Braj language by enabling easy translation from English. This application not only serves as a translation tool but also as an educational resource for those interested in learning Braj.

## Features

- **Cross-Platform Compatibility**: Accessible on both web and mobile platforms.
- **Responsive Design**: Adapts to various screen sizes and orientations.
- **Braj Language Translator**: Converts English sentences and terms into Braj language with high accuracy.
- **Dictionary Feature**: In-app dictionary for users to learn Braj language.
- **Model Visualization**: Dedicated page to visualize the machine learning model used for translation.

## Tech Stack

### Frontend
- **Framework**: Flutter
- **Language**: Dart
- **UI Design**: Material Design

### Backend
- **Framework**: FastAPI
- **Language**: Python
- **API**: RESTful API for processing translation requests

### Machine Learning
- **Modeling**: Natural Language Processing (NLP)
- **Model Training**: Google Colab
- **Deployment**: Docker

## Tools and Libraries Used

### Machine Learning
- `pandas`: Data manipulation and analysis.
- `numpy`: Numerical computing.
- `re`: Regular expressions for text processing.
- `seaborn`: Data visualization.
- `matplotlib`: Plotting and visualization.
- `pickle`: Model serialization and deserialization.
- `scikit-learn`: Machine learning library for model creation and evaluation.

### API Development
- `fastapi`: Fast and modern web framework for building APIs.
- `pydantic`: Data validation using Python type annotations.
- `uvicorn`: ASGI server for serving FastAPI applications.
- `cors`: Middleware for handling Cross-Origin Resource Sharing.

### Docker
- **Base Image**: `tiangolo/uvicorn-gunicorn-fastapi:python3.9`
- **Containerization**: Ensuring the backend service is scalable and easily deployable.

## Project Structure

```plaintext
├── app/
│   ├── main.py               # FastAPI main application file
│   ├── model/
│   │   ├── model.pkl         # Trained ML model file
│   │   ├── model.py          # Model prediction logic
├── lib/
│   ├── main.dart             # Flutter main application file
│   ├── screens/
│   │   ├── home.dart         # Home screen of the app
│   │   ├── about_model.dart  # Model visualization page
├── Dockerfile                # Docker configuration file
├── requirements.txt          # Python dependencies
└── README.md                 # Project documentation
```
### Installation
## Prerequisites
 - **Docker**: Ensure Docker is installed on your system.
 - **Flutter**: Install Flutter SDK for building and running the frontend.

## Setup
  - **Clone the Repository:**
  ```plaintext
  git clone https://github.com/your-username/Apni_bhasha_Apni_Sanskrit.git
  cd Apni_bhasha_Apni_Sanskrit
```
  - **Build and Run the Docker Container:**
    ```plaintext
    docker build -t apni_bhasha_apni_sanskrit .
    docker run -d -p 8000:8000 apni_bhasha_apni_sanskrit
    ```
# Usage

## Launching the Application

1. **Open the app** on your mobile device or in a web browser.
2. **Input an English sentence or term** in the designated field.
3. Press the **"Translate" button** to receive the translation in Braj language.

## Dictionary Feature

- Navigate to the **"Dictionary" tab** to explore and learn common Braj terms and phrases.

## Model Visualization

- Access the **"About Model" page** to view visualizations and insights into the machine learning model used for translation.

# Model Details

The machine learning model is based on Natural Language Processing (NLP) techniques and was trained using a dataset of English-Braj sentence pairs. The model employs the Naive Bayes algorithm, which is particularly effective for text classification tasks.

### Model Pipeline:

1. **Text Preprocessing**:
   - Tokenization
   - Stopword removal
   - Vectorization
2. **Modeling**:
   - Multinomial Naive Bayes classifier
3. **Evaluation**:
   - The model was evaluated using accuracy, confusion matrix, and classification reports.

# API Documentation

The RESTful API developed with FastAPI provides the following endpoints:

- **POST /translate**: Accepts an English sentence and returns the translated Braj sentence.
  - **Request**: JSON object with the English sentence.
  - **Response**: JSON object with the Braj translation.

### Example Request

```bash
curl -X POST "http://localhost:8000/translate" \
-H "Content-Type: application/json" \
-d '{"sentence": "How are you?"}'
```
### Example Response

```json
{
  "translation": "Tuma kai se hai?"
}
```

## Dockerization
- Docker is used to containerize the FastAPI backend, making it easy to deploy and scale. The Dockerfile sets up the environment by installing the necessary dependencies and copying the application code.

**Docker Commands**
- Build Docker Image:
```
docker build -t apni_bhasha_apni_sanskrit .
Run Docker Container:
docker run -d -p 8000:8000 apni_bhasha_apni_sanskrit
```
    



https://github.com/user-attachments/assets/356b7eab-c287-46af-9996-1b895bfb8871

