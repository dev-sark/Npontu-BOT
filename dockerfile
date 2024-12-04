# Step 1: Use an official Python runtime as a base image
FROM python:3.12-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the requirements.txt into the container
COPY requirements.txt .

# Step 4: Install dependencies in a virtual environment
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt

# Step 5: Add the virtual environment to PATH
ENV PATH="/opt/venv/bin:$PATH"

# Step 6: Copy the rest of the application files into the container
COPY . .

<<<<<<< HEAD
# Step 7: Ensure correct permissions for sensitive files
RUN chmod 644 /app/client_secret.json

# Step 8: Expose the port your app is running on
EXPOSE 5000

# Step 9: Set the default command to run the application
CMD ["gunicorn", "-b", "0.0.0.0:5000", "back:create_app()"]

=======
COPY client_secret.json /app/
# Step 6: Expose the port your app is running on (Flask's default port is 5000)
EXPOSE 5000

# Step 7: Set environment variables (optional, if you need them)    
# ENV FLASK_APP=back.py

CMD ["gunicorn", "-b", "0.0.0.0:5000", "back:create_app()"]

>>>>>>> e4a28063ea3200107e4210542d5e43cc78313b92
