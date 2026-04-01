FROM python:3.10-slim

# Linux સર્વરમાં FFmpeg ઇન્સ્ટોલ કરવા માટે
RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

WORKDIR /app

# ફાઈલો કોપી કરો
COPY . .

# લાઈબ્રેરી ઇન્સ્ટોલ કરો
RUN pip install --no-cache-dir flask yt-dlp gunicorn

# એપ ચલાવો
CMD ["gunicorn", "--bind", "0.0.0.0:10000", "ytdown:app"]
