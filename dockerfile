# Step 1: Use an official Python runtime as a base image
FROM python:3.12-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the requirements.txt into the container
COPY requirements.txt .

# Step 4: Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the rest of the application files into the container
COPY . .

# Step 6: Expose the port your app is running on (Flask's default port is 5000)
EXPOSE 5000

# Step 7: Set environment variables (optional, if you need them)
# ENV FLASK_APP=back.py

# Step 8: Run the Flask app (you mentioned you use `python back.py` to start it)
CMD ["python", "back.py"]
