FROM python:3.10-slim

# FFmpeg ઇન્સ્ટોલ કરવા માટે
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

# Render માટે પોર્ટ સેટિંગ
CMD ["gunicorn", "--bind", "0.0.0.0:10000", "ytdown:app"]
