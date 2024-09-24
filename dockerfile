FROM python:3.10

WORKDIR /app
COPY requirements.txt .

RUN pip install -r requirements.txt --default-timeout=100 future

# Copy the rest of the application files to the container's working directory
COPY . .

# Expose the port that Streamlit will run on
EXPOSE 8000

CMD ["streamlit", "run", "chatbot_app.py"]